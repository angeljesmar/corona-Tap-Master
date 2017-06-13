local widget = require("widget"); 

local composer = require( "composer" );


function setting_back(event)
radioGroup:removeSelf();
composer.gotoScene("main_screen","slideLeft");
end


local scene = composer.newScene()
 radioGroup = display.newGroup()
    usrtxt=display.newText("User",95,80,native.systemFont, 20)
	 radioButton1 = widget.newSwitch(
	{
	
		left = 80,
		top = 100,
		style = "radio",
		id = "RadioButton1",
		--label = "Default",
		--initialSwitchState = true,
		onPress = onSwitchPress
	}
	)
	radioGroup:insert(radioButton1)
 deftxt=display.newText("Default",215,80,native.systemFont, 20)

	 radioButton2 = widget.newSwitch(
	{
		left = 200,
		top = 100,
		style = "radio",
		label = "User Selection",
		id = "RadioButton2",
		onPress = onSwitchPress
	}
	)
	radioGroup:insert(radioButton2)
	--local switch = event.target
mintxt=display.newText("Minimum",150,190,native.systemFont, 20)
	 sliderMin = widget.newSlider(
	{
		top = 200,
		left = 33,
		width = 210,
		value = 0,
		listener = sliderListner
	}
	)
maxtxt=display.newText("Maximum",150,300,native.systemFont, 20)

	 sliderMax = widget.newSlider(
	{
		top = 300,
		left = 50,
		width = 210,
		value = 100,
		listener = sliderListner
	}
	)	
	radioGroup:insert(sliderMin)
	radioGroup:insert(sliderMax)
local back_button = widget.newButton({
  		sceneGroup,
  		width = 100,
  		height = 100,
  		defaultFile = "back.png",
  		onEvent = setting_back
  		})
  		
    back_button.x= 150;
 	back_button.y=450;
 	

radioGroup:insert(back_button)
radioGroup:insert(maxtxt)
radioGroup:insert(mintxt)
radioGroup:insert(deftxt)
radioGroup:insert(usrtxt)


return scene;