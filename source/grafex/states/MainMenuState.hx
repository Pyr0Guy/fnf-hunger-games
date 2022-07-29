package grafex.states;

import grafex.states.options.OptionsDirect;
import grafex.systems.Paths;
import grafex.systems.statesystem.MusicBeatState;
#if desktop
import utils.Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import grafex.data.WeekData;
import flixel.system.FlxAssets.FlxShader;
import lime.app.Application;
import grafex.states.editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;
import flixel.addons.display.FlxBackdrop;
import grafex.data.EngineData;
import grafex.systems.Conductor;
import flixel.addons.ui.FlxUIButton;
import flixel.ui.FlxButton;

using StringTools;

class MainMenuState extends MusicBeatState
{
	var bg:FlxSprite;

    override function create()
	{
				#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menu", null);
		#end
        WeekData.loadTheFirstEnabledMod();
        FlxG.watch.addQuick("beatShit", curBeat);
		FlxG.watch.addQuick("stepShit", curStep);

        if(FlxG.sound.music != null)
			if (!FlxG.sound.music.playing)
			{	
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
        		FlxG.sound.music.time = 9400;
				Conductor.changeBPM(102);
			}
		
		FlxG.mouse.visible = true;
		FlxG.mouse.useSystemCursor = false;

		bg = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		bg.scrollFactor.set(0, 0);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.visible = true;
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		bg.color = 0xff810f31;
		bg.scale.set(0.7, 0.7);
		add(bg);
		super.create();
		
		var myButton:FlxButton = new FlxButton(850, 165, "", clickA);
		myButton.loadGraphic('assets/images/mainmenu/button.png', false, 128, 128);
		myButton.scale.set(0.55, 0.55);
		add(myButton);
		super.create();
	}

	function clickA()
		{
			FlxG.switchState(new OptionsDirect());
		}
}