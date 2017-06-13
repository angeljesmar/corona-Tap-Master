local widget = require("widget"); 

local composer = require( "composer" );

local scene = composer.newScene()


function onEventListener(event)
	composer.gotoScene("scene2","slideLeft");-- goes to scene 2
end


function onEventListener1(event)
	composer.gotoScene("scene3","slideLeft");-- goes to scene 3
end

display.setDefault("background", 0,0,0);

function scene:create(event)

	local sceneGroup = self.view
	title= display.newText( sceneGroup, "TAP MASTER",135,20 , "verdana", 35 )
	title:setFillColor(0.15,0.40,0.67)
	name= display.newText( sceneGroup,"Vamsy Jasti", 230, 400, "verdana", 25 ) -- Display Text
 	name:setFillColor(0.15,0.40,0.67);
  	name1=display.newText(sceneGroup, "Hari N Varma", 230, 445, "verdana", 25) -- Display Text
  	name1:setFillColor(0.15,0.40,0.67);

  	local play_button = widget.newButton({ --defining a button
  		sceneGroup,
  		width = 100,
  		height = 100,
  		defaultFile = "play.png",
  		onEvent = onEventListener
  		})

 	play_button.x= 150;
 	play_button.y=150;
 	
 	local set_button = widget.newButton({ --defining a button
  		sceneGroup,
  		width = 100,
  		height = 100,
  		defaultFile = "set.png",
  		onEvent = onEventListener1
  		})

 	set_button.x= 150;
 	set_button.y=280;

  	--[[local settings_button = widget.newButton({
  		sceneGroup,
  		width = 100,
  		height = 100,
  		defaultFile = "settings.png",
  		onEvent = onEventListener1
  		}) 	
 	
 	settings_button.x= 150;
 	settings_button.y=290;
 	]]
 	sceneGroup:insert(play_button);
 	sceneGroup:insert(set_button);
 	sceneGroup:insert(name);
  	sceneGroup:insert(title);
  	sceneGroup:insert(name1);
  	--[[sceneGroup:insert(play_button);
	sceneGroup:insert(settings_button);
]]end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene;