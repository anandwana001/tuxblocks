package tuxkids.tuxblocks.core.title;

import java.util.ArrayList;
import java.util.List;

import playn.core.CanvasImage;
import playn.core.Color;
import playn.core.ImageLayer;
import playn.core.Pointer.Event;
import playn.core.TextFormat;
import playn.core.util.Clock;
import tripleplay.game.ScreenStack;
import tripleplay.util.Colors;
import tuxkids.tuxblocks.core.Button;
import tuxkids.tuxblocks.core.Button.OnReleasedListener;
import tuxkids.tuxblocks.core.Cache;
import tuxkids.tuxblocks.core.Constant;
import tuxkids.tuxblocks.core.GameBackgroundSprite;
import tuxkids.tuxblocks.core.GameState;
import tuxkids.tuxblocks.core.MenuLayer;
import tuxkids.tuxblocks.core.PlayNObject;
import tuxkids.tuxblocks.core.defense.DefenseScreen;
import tuxkids.tuxblocks.core.screen.BaseScreen;
import tuxkids.tuxblocks.core.solve.blocks.Equation;
import tuxkids.tuxblocks.core.solve.blocks.EquationGenerator;
import tuxkids.tuxblocks.core.solve.markup.ExpressionWriter;
import tuxkids.tuxblocks.core.title.SlideLayer.StopChangedListener;
import tuxkids.tuxblocks.core.utils.CanvasUtils;

public class DifficultyScreen extends BaseScreen {
	
	protected final List<SlideLayer> slideLayers = new ArrayList<SlideLayer>();
	protected final SlideLayer mathSlider, gameSlider, timeSlider;
	protected final TextFormat promptFormat, descriptionFormat;
	protected final float spacing;
	
	public DifficultyScreen(ScreenStack screens, final GameBackgroundSprite background) {
		super(screens, background);
		
		MenuLayer menu = new MenuLayer(width(), background.primaryColor());
		layer.add(menu.layerAddable());
		
		ImageLayer titleLayer = graphics().createImageLayer();
		titleLayer.setImage(CanvasUtils.createTextCached("Choose Difficulty", 
				Cache.createFormat(menu.height() * 0.5f), Colors.BLACK));
		titleLayer.setDepth(1);
		titleLayer.setTranslation(width() / 2, menu.height() / 2);
		PlayNObject.centerImageLayer(titleLayer);
		layer.add(titleLayer);
		
		spacing = height() / 4.5f;
		float offY = menu.height() * 0.95f;
		
		promptFormat = Cache.createFormat(height() / 22);
		descriptionFormat = Cache.createFormat(height() / 35);
		
		mathSlider = createSlideLyer("Math difficulty:", null, 0.5f * spacing + offY,
				"1", "2", "3", "4", "5");
		

		final ImageLayer descriptionLayer = graphics().createImageLayer();
		descriptionLayer.setImage(CanvasUtils.createTextCached("Sample problem:", descriptionFormat, Colors.WHITE));
		layer.add(descriptionLayer);
		
		final ImageLayer equationLayer = graphics().createImageLayer();
		equationLayer.setTranslation(width() * 0.6f + descriptionLayer.width() / 2, 0.75f * spacing + mathSlider.ty());
		equationLayer.setDepth(-1);
		descriptionLayer.setTy(equationLayer.ty() - descriptionLayer.height() / 2);
		layer.add(equationLayer);
		
		mathSlider.setStopChangedListener(new StopChangedListener() {
			@Override
			public void onStopChanged(int stop) {
				Equation eq = EquationGenerator.generateEquation(stop + 1);
				int size = Math.round(Math.min(height() / 16 / eq.renderer().lines(), height() / 18));
				ExpressionWriter writer = eq.renderer().getExpressionWriter(Cache.createFormat(size));
				float pad = height() / 40, rad = pad / 2;
				CanvasImage image = CanvasUtils.createRoundRect(writer.width() + pad * 2, writer.height() + pad * 2, rad, 
						Color.withAlpha(Colors.WHITE, 200), pad / 2, Colors.GRAY);
				image.canvas().translate(pad, pad);
				writer.drawExpression(image.canvas());
				equationLayer.setImage(image);
				PlayNObject.centerImageLayer(equationLayer);
				
				descriptionLayer.setTx(equationLayer.tx() - equationLayer.width() / 2 - descriptionLayer.width() * 1.1f);
			}
		});

		
		gameSlider = createSlideLyer("Game difficulty:",
				"How difficult Blocks are to destroy",
				2f * spacing + offY, "1", "2", "3", "4", "5");
		
		timeSlider = createSlideLyer("Solve time:", 
				"How long you have to solve problems between rounds",
				3f * spacing + offY, Constant.INFINITY_SYMBOL, "60s", "50s", "40s", "30s");
		
		mathSlider.setStop(2, true);
		gameSlider.setStop(2, true);
		timeSlider.setStop(2, true);
		
		Button buttonOk = menu.addRightButton(Constant.BUTTON_OK);
		buttonOk.setOnReleasedListener(new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) {
					startGame();
				}
			}
		});
		
		Button buttonBack = menu.addLeftButton(Constant.BUTTON_BACK);
		buttonBack.setOnReleasedListener(new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) {
					popThis();
				}
			}
		});
	}
	
	private void startGame() {
		GameState state = new GameState(background);
		DefenseScreen ds = new DefenseScreen(screens, state);
		pushScreen(ds, screens.slide().down());
		screens.remove(this);
	}
	
	private SlideLayer createSlideLyer(String prompt, String description, float height, String... stops) {
		ImageLayer promptLayer = graphics().createImageLayer();
		promptLayer.setImage(CanvasUtils.createTextCached(prompt, promptFormat, Colors.WHITE));
		promptLayer.setTranslation(width() * 0.025f + promptLayer.width() / 2, height);
		PlayNObject.centerImageLayer(promptLayer);
		layer.add(promptLayer);
		
		if (description != null) {
			ImageLayer descriptionLayer = graphics().createImageLayer();
			descriptionLayer.setImage(CanvasUtils.createTextCached(description, descriptionFormat, Colors.WHITE));
			descriptionLayer.setTranslation(width() * 0.6f, height + spacing / 2);
			PlayNObject.centerImageLayer(descriptionLayer);
			layer.add(descriptionLayer);
		}
		
		SlideLayer slider = new SlideLayer(width() * 0.7f, 
				height() / 6, background.primaryColor(), stops);
		slider.centerLayer();
		slider.setTranslation(width() * 0.6f, height);
		layer.add(slider.layerAddable());
		slideLayers.add(slider);
		return slider;
	}
	
	@Override
	public void update(int delta) {
		super.update(delta);
	}
	
	@Override
	public void paint(Clock clock) {
		super.paint(clock);
		for (SlideLayer slide : slideLayers) {
			slide.paint(clock);
		}
	}

}