package tuxkids.tuxblocks.core.solve.blocks;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import playn.core.CanvasImage;
import playn.core.Font.Style;
import playn.core.GroupLayer;
import playn.core.Image;
import playn.core.ImageLayer;
import playn.core.Layer;
import playn.core.PlayN;
import playn.core.Pointer.Event;
import playn.core.TextFormat;
import playn.core.util.Clock;
import tripleplay.particle.Emitter;
import tripleplay.particle.Generator;
import tripleplay.particle.TuxParticles;
import tripleplay.particle.effect.Alpha;
import tripleplay.particle.effect.Move;
import tripleplay.particle.init.Color;
import tripleplay.particle.init.Lifespan;
import tripleplay.particle.init.TuxTransform;
import tripleplay.particle.init.TuxVelocity;
import tripleplay.util.Colors;
import tripleplay.util.Interpolator;
import tripleplay.util.Randoms;
import tuxkids.tuxblocks.core.Audio;
import tuxkids.tuxblocks.core.Constant;
import tuxkids.tuxblocks.core.GameState.Stat;
import tuxkids.tuxblocks.core.solve.SolveScreen;
import tuxkids.tuxblocks.core.solve.blocks.Sprite.BlockListener;
import tuxkids.tuxblocks.core.solve.blocks.Sprite.SimplifyListener;
import tuxkids.tuxblocks.core.solve.build.BuildScreen;
import tuxkids.tuxblocks.core.solve.markup.BaseRenderer;
import tuxkids.tuxblocks.core.solve.markup.ExpressionWriter;
import tuxkids.tuxblocks.core.solve.markup.JoinRenderer;
import tuxkids.tuxblocks.core.solve.markup.Renderer;
import tuxkids.tuxblocks.core.tutorial.Tutorial;
import tuxkids.tuxblocks.core.tutorial.Tutorial.Trigger;
import tuxkids.tuxblocks.core.utils.CanvasUtils;
import tuxkids.tuxblocks.core.utils.MultiList;
import tuxkids.tuxblocks.core.utils.PlayNObject;

/**
 * Responsible for manipulating {@link Equation} on the {@link SolveScreen}
 * or {@link BuildScreen}.
 */
public class BlockController extends PlayNObject {
	
	public enum Side {
		Left, Right;
	}

	private final static float EQ_BUFFER = 50; // space left between sides for the = sign
	private static final float DRAGGING_DEPTH = 1; // depth for dragging blocks
	private static final int MAX_BLOCKS = 4; // max blocks in the BuildScreen

	private Parent parent; // for callbacks to the Screen hosting this controller
	private float width, height;
	private GroupLayer layer;
	private List<BaseBlock> leftSide = new ArrayList<BaseBlock>(), rightSide = new ArrayList<BaseBlock>(), // sides of the equation
			removingLeft = new ArrayList<BaseBlock>(), removingRight = new ArrayList<BaseBlock>(); // BlockHolders being removed in BuildMode
	@SuppressWarnings("unchecked")
	private MultiList<BaseBlock> baseBlocks = new MultiList<BaseBlock>(leftSide, rightSide); // all Blocks in the equation
	private Listener listener = new Listener(); // callbacks for the Blocks
	
	private BaseBlock draggingFrom, tempDraggingFrom; // which BaseBlock the currently dragging Block is coming from
	private List<BaseBlock> draggingFromSide; // which side the currently dragging Block is coming from
	private Block dragging, tempDragging; // which block is currently dragging
	private float blockAnchorPX, blockAnchorPY; // where [0-1] on the currently dragging Block are we grabbing it
	private float lastTouchX, lastTouchY; // last position of the drag
	private boolean inverted; // is the currently dragging Block inverted (past the equals)
	private BaseBlock hoverSprite; // the BaseBlock the currently dragging Block is currently hovering over
	
	private float equalsX; // x-coordinate of the =
	private ImageLayer equals; // the ImageLayer for the =
	private boolean solved;  // true if the equation is in a solved state
	private float equationImageHeight = 120; // height of the Renderer's image
	private Image equationImage; // the ImageLayer for the Renderer's image of the equation
	private boolean refreshEquation; // true if the equationImage needs refreshing
	
	private boolean inBuildMode; // true if this is being hosted by a BuildScreen
	private BuildToolbox buildToolbox; // if inBuildMode, we need a reference to the BuildToolbox
	
	/** The height at which the equation Image will be rendered */
	public float equationImageHieght() {
		return equationImageHeight;
	}
	
	/** Set the height at which the equation Image will be rendered */
	public void setEquationImageHeight(float equationImageHeight) { 
		this.equationImageHeight = equationImageHeight;
		refreshEquation = true;
	}
	
	public Layer layer() {
		return layer;
	}
	
	public boolean inBuildMode() {
		return inBuildMode;
	}
	
	/** Returns the image generated by a {@link Renderer} for the current state of the {@link Equation} */
	public Image equationImage() {
		return equationImage;
	}
	
	/** Registers a {@link BuildToolbox} with this Controller (used in BuildMode)  */
	public void setBuildToolbox(BuildToolbox buildToolbox) {
		this.buildToolbox = buildToolbox;
		inBuildMode = buildToolbox != null;
	}
	
	// the left and top sides of the equation manipulation area
	
	private float offX() {
		return getGlobalTx(layer);
	}
	
	private float offY() {
		return getGlobalTy(layer);
	}
	
	/** Creates and returns an Equation representing the current state of this controller */
	public Equation equation() {
		ArrayList<BaseBlock> lhs = new ArrayList<BaseBlock>(),
				rhs = new ArrayList<BaseBlock>();
		for (BaseBlock sprite : leftSide) {
			lhs.add((BaseBlock) sprite.copy());
		}
		for (BaseBlock sprite : rightSide) {
			rhs.add((BaseBlock) sprite.copy());
		}
		return new Equation(lhs, rhs);
	}
	
	/** Returns true if the {@link Equation} is in a solved state */
	public boolean solved() {
		return solved;
	}

	/** Returns the BlockListener for {@link Sprite} in this controller */
	public BlockListener blockListener() {
		return listener;
	}
	
	public BlockController(Parent parent, float width, float height) {
		this.parent = parent;
		this.width = width;
		this.height = height;
		layer = graphics().createGroupLayer();
		equals = graphics().createImageLayer(CanvasUtils.createTextCached("=", 
				new TextFormat().withFont(graphics().createFont(Constant.FONT_NAME, Style.PLAIN, 20)), Colors.WHITE));
		centerImageLayer(equals);
		layer.add(equals);
	}
	
	/** Clears and destroys the current {@link Equation} */
	public void clear() {
		for (BaseBlock sprite : baseBlocks) {
			sprite.destroy();
		}
		leftSide.clear();
		rightSide.clear();
		solved = false;
		dragging = draggingFrom = null;
	}
	
	/** Sets the current equation */
	public void setEquation(Equation equation) {
		clear();
		for (BaseBlock sprite : equation.leftSide()) {
			addExpression(Side.Left, sprite);
		}
		for (BaseBlock sprite : equation.rightSide()) {
			addExpression(Side.Right, sprite);
		}
		updateExpressionPositions(0, 1);
	}
	
	/** Adds the given expression to the given side (used in construction, no during manipulation) */
	public void addExpression(Side side, BaseBlock expression) {
		List<BaseBlock> blocks = getBlocks(side);
		addExpression(blocks, expression, 0, 0, blocks.size());
		refreshEquationImage();
	}
	
	// adds the expression at to the given side at the given index
	private void addExpression(List<BaseBlock> side, BaseBlock expression, float x, float y, int index) {
		expression.initSprite();
		layer.addAt(expression.layer(), x, y);
		expression.layer().setDepth(0);
		side.add(index, expression);
		expression.addBlockListener(listener);
		refreshEquation = true;
		refreshEquals();
	}
	
	// removed the expression from the given side
	private void removeExpression(List<BaseBlock> side, BaseBlock expression) {
		side.remove(expression);
		refreshEquation = true;
		refreshEquals();
	}
	
	// refreshes the position of the =
	private void refreshEquals() {
		equalsX = (leftSide.size() + 0.5f) / (baseBlocks.size() + 1) * width;
		equals.setTranslation(equalsX, height / 2);
	}
	
	// swaps out one expression for another on the given side
	private void swapExpression(List<BaseBlock> side, BaseBlock original, BaseBlock newExp) {
		int index = side.indexOf(original);
		side.remove(index);
		addExpression(side, newExp, original.layer().tx(), original.layer().ty(), index);
	}
	
	// check to see if the equation is solved
	private boolean refreshSolved() {
		if (dragging != null) return false;
		int numbers = 0, variables = 0;
		for (BaseBlock sprite : baseBlocks) {
			if (!sprite.isUnmodified()) return false;
			if (sprite instanceof NumberBlock) {
				numbers++;
			}
			if (sprite instanceof VariableBlock) {
				variables++;
			}
		}
		return numbers <= 1 && variables == 1;
	}
	
	// refreshes the equation image
	private void refreshEquationImage() {
		Renderer lhs = getRenderer(leftSide);
		Renderer rhs = getRenderer(rightSide);
		Renderer equation = new JoinRenderer(lhs, rhs, "=");
		
		// adjust the text size for the number of lines 
		float textSize = equationImageHeight * 0.6f / Math.max(3, equation.lines());
		TextFormat format = new TextFormat().withFont(graphics().createFont(Constant.FONT_NAME, Style.PLAIN, textSize));
		ExpressionWriter writer = equation.getExpressionWriter(format);
		
		CanvasImage image = graphics().createImage(writer.width(), writer.height());
		image.canvas().setFillColor(Colors.WHITE);
		image.canvas().setStrokeColor(Colors.WHITE);
		writer.drawExpression(image.canvas());
		
		equationImage = image;
		refreshEquation = false;
	}
	
	// gets a renderer for the given side
	private Renderer getRenderer(List<BaseBlock> side) {
		if (hoverSprite == null) hoverSprite = draggingFrom;
		Renderer renderer = null;
		for (BaseBlock base : side) {
			Renderer toAdd;
			// preview the possible addition of the dragging sprite to the hoverSprite
			if (dragging != null && base == hoverSprite) {
				toAdd = base.createRendererWith(dragging, hoverSprite == draggingFrom && inverted);
			} else {
				if (base instanceof BlockHolder) continue;
				toAdd = base.createRenderer();
			}
			if (renderer == null) renderer = toAdd;
			else {
				// add each expression
				renderer = new JoinRenderer(renderer, toAdd, "+");
			}
		}
		if (renderer == null) renderer = new BaseRenderer("0");
		return renderer;
	}
	
	private List<BaseBlock> getBlocks(Side side) {
		return side == Side.Left ? leftSide : rightSide;
	}
	
	private List<BaseBlock> getOpposite(List<BaseBlock> side) {
		return side == rightSide ? leftSide : rightSide;
	}
	
	private List<BaseBlock> getContaining(BaseBlock block) {
		return leftSide.contains(block) ? leftSide : rightSide;
	}
	
	public void update(int delta) {
		int bb = 0;
		for (BaseBlock s : baseBlocks) {
			if (!(s instanceof BlockHolder)) bb++;
		}
		updateSide(delta, leftSide, bb);
		updateSide(delta, rightSide, bb);
		if (dragging != null) dragging.update(delta);
		if (refreshEquation) {
			refreshEquationImage();
			solved = refreshSolved();
		}
	}
	
	//updates the BaseBlocks on the given side
	private void updateSide(int delta, List<BaseBlock> side, int totalBlocks) {
		boolean multiExpression = totalBlocks > 2; // can't drag factors if there are >2 expressions
		if (!multiExpression) {
			int bb = 0;
			for (BaseBlock s : side) {
				if (!(s instanceof BlockHolder)) bb++;
			}
			if (bb > 1) multiExpression = true; // or if there is >1 expression on any given side
		}
		for (BaseBlock sprite : side) {
			boolean moveBase = false;
			for (BaseBlock other : side) {
				if (other != sprite && other.canAccept(sprite)) {
					// can only move a BaseBlock if another Block can accept it
					moveBase = true;
				}
			}
			if (!moveBase) {
				for (BaseBlock other : getOpposite(side)) {
					if (other.canAccept(sprite)) {
						moveBase = true;
					}
				}
			}
			sprite.update(delta, multiExpression, moveBase);
		}
	}
	
	public void paint(Clock clock) {
		for (BaseBlock sprite : baseBlocks) {
			sprite.paint(clock);
		}
		
		updateExpressionPositions(0.99f, clock.dt());
		updateRemoving(0.99f, clock.dt());
		
		if (dragging != null) dragging.paint(clock);
		updatePosition();
		particles.paint(clock);
	}
	
	private void updateRemoving(float base, float dt) {
		updateRemovingSide(removingLeft, -width / 2, base, dt);
		updateRemovingSide(removingRight, width * 3 / 2, base, dt);
	}
	
	private void updateRemovingSide(List<BaseBlock> list, float off, float base, float dt) {
		for (int i = 0; i < list.size(); i++) {
			BaseBlock removing = list.get(i);
			removing.layer().setTx(lerpTime(removing.layer().tx(), off, base, dt, 1f));
			if (removing.layer().tx() == off) {
				removing.destroy();
				list.remove(i--);
			}
		}
	}

	private void updateExpressionPositions(float base, float dt) {
		int i = 1;
		for (BaseBlock sprite : baseBlocks) {
			// super-fancy positioning algorithm
			float x = i++ * (width - EQ_BUFFER) / (baseBlocks.size() + 1) - sprite.totalWidth() / 2 - sprite.offsetX();
			if (i > leftSide.size() + 1) x += EQ_BUFFER;
			sprite.layer().setTx(lerpTime(sprite.layer().tx(), x, base, dt, 1f));
			sprite.layer().setTy(lerpTime(sprite.layer().ty(), (height - sprite.height()) / 2, base, dt, 1f));
		}
	}
	
	// updates the position of the dragging Block
	private void updatePosition() {
		if (dragging != null) {
			float x = lastTouchX - dragging.width() * blockAnchorPX;
			float y = lastTouchY - dragging.height() * blockAnchorPY;
			dragging.layer().setTranslation(x, y);
		}
	}
	
	// can the dragging Block be dropped on teh given Block at the given position
	private boolean canDropOn(BaseBlock base, float x, float y) {
		if (base.intersects(dragging)) {
			if (base instanceof BlockHolder && dragging instanceof VerticalModifierBlock) {
				int blocks = 0;
				for (BaseBlock block : baseBlocks) {
					if (!(block instanceof BlockHolder)) blocks++;
				}
				return blocks == 1;
			}
			return base.canAccept(dragging);
		}
		return false;
	}
	
	// invert the dragging Block when it crosses the =
	private void invertDragging(boolean refresh) {
		Block block = dragging.inverse();
		dragging.showInverse();
		if (refresh) {
			layer.remove(dragging.layer());
			layer.add(block.layer());
			block.layer().setDepth(DRAGGING_DEPTH);
		}
		dragging = block;
	}
	
	// give a nice little POOF when the block crosses the equals
	private TuxParticles particles = new TuxParticles();
	private void showInvertAnimation(float x, float y) {
		int p = 30;
		Emitter emitter = particles.createEmitter(p, CanvasUtils.createCircleCached(10, Colors.WHITE), layer);
		emitter.generator = Generator.impulse(p);
        emitter.initters.add(Lifespan.constant(1));
        emitter.initters.add(Color.constant(Colors.WHITE));
        emitter.initters.add(TuxTransform.layer(emitter.layer));
        Randoms rando = Randoms.with(new Random());
        emitter.initters.add(TuxVelocity.randomCircle(rando, 50));
        emitter.effectors.add(new Move());
        emitter.effectors.add(Alpha.byAge(Interpolator.EASE_OUT, 1, 0));
        emitter.destroyOnEmpty();
        emitter.layer.setTranslation(x - offX(), y - offY());
        emitter.layer.setDepth(100);
	}
	
	private void updateBlockHolders() {
		if (!inBuildMode) return;
		updateBlockHolder(leftSide, Side.Left);
		updateBlockHolder(rightSide, Side.Right);
		// I think this is necessary because things might change for the left
		// side after the right is updated. Just go with it.
		updateBlockHolder(leftSide, Side.Left); 
	}
	
	// makes excess BlockHolders appear/disappear in BuildMode
	private void updateBlockHolder(List<BaseBlock> blocks, Side side) {
		int holders = 0;
		BaseBlock lastHolder = null;
		for (BaseBlock block : blocks) {
			if (block instanceof BlockHolder) {
				holders++;
				if (block != draggingFrom) lastHolder = block;
			}
		}
		if (holders == 0 && baseBlocks.size() < MAX_BLOCKS) {
			BlockHolder holder = new BlockHolder();
			float x = side == Side.Left ? - width / 2 : width * 3 / 2;
			float y = height / 2 - Sprite.baseSize() / 2;
			addExpression(blocks, holder, x, y, side == Side.Left ? 0 : blocks.size());
		} else if (holders > 1) {
			removeExpression(blocks, lastHolder);
			if (side == Side.Left) {
				removingLeft.add(lastHolder);
			} else {
				removingRight.add(lastHolder);
			}
			blocks.remove(lastHolder);
		}
	}

	// adjust touches for the position of the controller
	
	private float getTouchX(Event event) {
		return event.x() - offX();
	}
	
	private float getTouchY(Event event) {
		return event.y() - offY();
	}
	
	private float spriteX(Sprite sprite) {
		return getGlobalTx(sprite.layer()) - offX();
	}
	
	private float spriteY(Sprite sprite) {
		return getGlobalTy(sprite.layer()) - offY();
	}
	
	// TODO: should probably just pass the controller to the blocks,
	// rather than trying to accomplish everything through a listener
	
	private class Listener implements BlockListener {

		@Override
		public void wasGrabbed(Block sprite, Event event) {
			if (buildToolbox != null) buildToolbox.wasGrabbed(event);
			
			float x = getTouchX(event), y = getTouchY(event);
			
			// find the BaseBlock of the Sprite that was grabbed 
			for (BaseBlock base : baseBlocks) {
				if (base.contains(sprite)) {
					draggingFrom = base;
					break;
				}
			}
			
			if (draggingFrom == null) {
				if (inBuildMode) {
					// The happens when we drag from the ToolBox, so we copy the dragging Sprite
					Block nSprite = (Block) sprite.copy(true);
					nSprite.layer().setTranslation(sprite.layer().tx(), sprite.layer().ty());
					nSprite.interpolateDefaultRect(null);
					sprite = nSprite;
				} else {
					// This happens when the dragging block isn't a part of any BaseBlock's group
					// which shouldn't be able to happen but somehow has... so we cancel everything
					debug("BIG PROBLEM!");
					sprite.cancelDrag();
					PlayN.pointer().cancelLayerDrags();
					return;
				}
			}
			
			draggingFromSide = getContaining(draggingFrom);
			
			blockAnchorPX = (x - spriteX(sprite)) / sprite.width();
			blockAnchorPY = (y - spriteY(sprite)) / sprite.height();
			
			if (sprite == draggingFrom) {
				// we're picking up a BaseBlock, so replace it with a BlockHolder
				BlockHolder holder = new BlockHolder();
				swapExpression(draggingFromSide, draggingFrom, holder);
				draggingFrom = holder;
			}
			
			// get the dragging Sprite and add it to our layer
			dragging = sprite.getDraggingSprite();
			layer.add(dragging.layer());
			dragging.layer().setDepth(DRAGGING_DEPTH);

			// remove the sprite from its group
			sprite.remove();
			if (sprite != dragging) {
				// and make it invisible if it's not the dragging sprite
				sprite.layer().setVisible(false);
			}
			
			lastTouchX = x;
			lastTouchY = y;
			inverted = false;
			refreshEquation = true;
			updatePosition();
			
			Audio.se().play(Constant.SE_TICK);
		}

		@Override
		public void wasReleased(Event event) {
			
			if (buildToolbox != null && buildToolbox.wasDropped(event)) {
				// delete the sprite if it's dropped onto the toolbox
				draggingFrom = null;
			}
			
			float x = getTouchX(event), y = getTouchY(event);
			lastTouchX = x - layer.tx();
			lastTouchY = y - layer.ty();
			
			// the drop target is either what we're hovering over or the
			// BaseBlock dragging came from originally (it snaps back)
			BaseBlock target = null;
			for (BaseBlock base : baseBlocks) {
				base.clearPreview();
				if (target == null && canDropOn(base, x, y)) {
					target = base;
				}
			}
			
			if (target == null) {
				// if we're snapping back, cancel the invert
				target = draggingFrom;
				if (inverted) {
					invertDragging(true);
				}
			} 
			
			if (target != draggingFrom){
				if (dragging instanceof BaseBlock) {
					Tutorial.trigger(Trigger.Solve_BaseBlockReleasedOnOther);
				}
				Tutorial.trigger(Trigger.Solve_BlockReleasedOnOther);
			}
			Tutorial.trigger(Trigger.Solve_BlockReleased);
			
			dropOn(target);
		}
		
		private void dropOn(BaseBlock target) {
			
			if (target == null) {
				if (!inBuildMode) debug("BIG PROBLEM!");
				// delete the sprite if it's dropped onto the toolbox
				dragging.destroy();
			} else {
				if (target instanceof BlockHolder) {
					// if dropped on a BlockHolder, replace it with the dropped Block
					
					if (dragging instanceof VerticalModifierBlock) {
						// 0 * or / n = 0
						dragging.destroy();
					} else {
						if (dragging instanceof HorizontalModifierBlock) {
							// turn a HorizontalModifier into a NumberBlock
							NumberBlockProxy proxy = ((HorizontalModifierBlock) dragging).getProxy(false);
							dragging.layer().setVisible(false);
							dragging = proxy;
						} else if (dragging instanceof BaseBlock) {
							ModifierGroup mods = ((BaseBlock) dragging).modifiers;
							if (mods.isModifiedHorizontally() || mods.isModifiedVertically() || mods.children.size() > 0) {
								Tutorial.trigger(Trigger.Solve_BlockWithModifiersReleasedOnBlank);
							}
						}
						
						swapExpression(getContaining(target), target, (BaseBlock) dragging);
						target.layer().destroy();
					}
					
					Tutorial.trigger(Trigger.Solve_BlockReleasedOnBlank);
				} else {
					if (dragging instanceof VariableBlock && target instanceof VariableBlock) {
						Tutorial.trigger(Trigger.Solve_VariablesStartedCombine);
					}
					
					ModifierBlock added = target.addBlock(dragging, false);
					if (added == null) {
						// this happens when the drop requires a trip to the SolveScreen to resolve
						// when we get back, we use these values to reset the Block if the solve failed
						tempDragging = dragging;
						tempDraggingFrom = draggingFrom;
					} else {
						added.layer().setTranslation(added.layer().tx() - spriteX(target), 
								added.layer().ty() - spriteY(target));
					}
				}
			}
			updateBlockHolders();
			
			dragging = null;
			draggingFrom = null;
			hoverSprite = null;
			
			refreshEquation = true;
			
			Audio.se().play(Constant.SE_DROP);
		}

		@Override
		public void wasMoved(Event event) {
			if (buildToolbox != null) buildToolbox.wasMoved(event);
			
			float x = getTouchX(event), y = getTouchY(event);
			lastTouchX = x;
			lastTouchY = y;
			
			// update the hoverSprite and Block previews
			BaseBlock lastHover = hoverSprite;
			hoverSprite = null;
			for (BaseBlock base : baseBlocks) {
				if (hoverSprite == null && canDropOn(base, x, y)) {
					base.setPreview(true);
					hoverSprite = base;
				} else {
					base.setPreview(false);
				}
			}
			if (hoverSprite == null) {
				hoverSprite = draggingFrom;
			}
			if (hoverSprite != lastHover) {
				refreshEquation = true;
			}
			
			if (!inBuildMode) {
				// invert blocks that pass the equals
				
				boolean invert;
				boolean checkLeftDistance = draggingFromSide == leftSide;
				if (inverted) checkLeftDistance = !checkLeftDistance;
				if (checkLeftDistance) {
					invert = x > equalsX + 5;
				} else {
					invert = x < equalsX - 5;
				}
				
				if (invert) {
					inverted = !inverted;
					invertDragging(true);
					showInvertAnimation(equalsX, 
							event.y() - (blockAnchorPY - 0.5f) * dragging.height());
				}
			}
		}

		@Override
		public void wasDoubleClicked(Block sprite, Event event) {
			if (sprite instanceof VerticalModifierBlock) {
				if (!((ModifierBlock) sprite).canAddInverse()) return;
				Tutorial.trigger(Trigger.Solve_VerticalModifierDoubleClicked);
				
				// add a Times or OverBlock to each BaseBlock to cancel out the
				// one that was double-clicked
				
				float y;
				if (sprite instanceof TimesBlock) {
					if (((VerticalModifierBlock) sprite).value == -1) {
						y = -graphics().height() / 2;
					} else {
						y = graphics().height() / 2;
					}
				} else {
					y = -graphics().height() / 2;
				}
				for (BaseBlock base : baseBlocks) {
					if (!(base instanceof BlockHolder)) {
						ModifierBlock inverse = (ModifierBlock) ((VerticalModifierBlock) sprite).inverse().copy(true);
						inverse.interpolateRect(base.offsetX(), y, base.totalWidth(), inverse.height(), 0, 1);
						base.addModifier(inverse, false);
					}
				}
				refreshEquation = true;
			}
			

			Audio.se().play(Constant.SE_TICK);
		}

		@Override
		public void wasSimplified() {
			refreshEquation = true;
			Tutorial.trigger(Trigger.Solve_Simplified);
			Audio.se().play(Constant.SE_TICK);
		}

		@Override
		public void wasReduced(Renderer problem, int answer, int startNumber, 
				Stat stat, int level, SimplifyListener callback) {
			// pass it on to the parent
			parent.showNumberSelectScreen(problem, answer, startNumber, stat, level, callback);
			Audio.se().play(Constant.SE_TICK);
		}
		
		@Override
		public void wasCanceled() {
			dragging = tempDragging;
			draggingFrom = tempDraggingFrom;
			tempDragging = tempDraggingFrom = null;
			dropOn(draggingFrom);
		}

		@Override
		public boolean inBuildMode() {
			return inBuildMode;
		}
		
		
	}
	
	public interface Parent {
		void showNumberSelectScreen(Renderer problem, int answer, int startNumber, 
				Stat stat, int level, SimplifyListener callback);
	}
	
	public interface BuildToolbox {
		void wasGrabbed(Event event);
		void wasMoved(Event event);
		boolean wasDropped(Event event);
	}
}
