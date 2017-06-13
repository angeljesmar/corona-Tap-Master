local widget = require("widget"); 

local composer = require( "composer" );

local scene = composer.newScene()

--initialisationa all the variables to zero 
round = 0  -- The number of rounds in the game
application_start = 0;  -- Time taken once the application has been started.
touch_start = 0;  -- Time taken till the boxe has been touched 
average_response_time = 0;  -- calculating the average response time.
correct = 0;  -- number of correct tap made by the player. (tapping on blue box)
incorrect = 0; -- number of the incorrect tap made by the player ( tapping on the red box)
timevalue = 0; -- The time value to be displayed. Here timevalue is the average response time. 
Rect_Position = nil;  -- The value for the rectangle boxes. iniiales to nil.
startgame = 0   --flag that starts the game 
count = 0; -- counts the number of correct taps, to find the average
Total_response_time = 0;

-- Display text Function displays the score of the player everytime when the tap is made. 

local function Display_Text()

	timeText = display.newText ("TIME:", 30, 20,native.systemFont, 15);-- create the text name called TIME.
	timeText:setFillColor (1,0,1);-- fill color for the text
	timeVal = display.newText (timevalue, 65, 20, native.systemFont, 15); -- updates the response time as time value here. 
	timeVal:setFillColor (1,0,1); -- fill color for the average response time displayed. 


	CORRECT_TEXT = display.newText ("CORRECT:", 130, 20,native.systemFont, 15); -- creates the new text called CORRECT.
	CORRECT_TEXT:setFillColor (0,0,1); -- fills the color for the text.
	correct_value = display.newText (correct, 185, 20, native.systemFont, 15); -- updates the CORRECT taps value here.
	correct_value:setFillColor (0,0,1);-- fills color for the correct tap made.

	INCORRECT_TEXT = display.newText ("INCORRECT:", 250, 20,native.systemFont, 15); -- create the text name called INCORRECT
	INCORRECT_TEXT:setFillColor (1,0,0); -- fills color for the text. 
	incorrect_value = display.newText (incorrect, 315, 20, native.systemFont, 15);-- updates the INCORRECT tap value. 
	incorrect_value:setFillColor (1,0,0); -- fills color for the incorrect tap made.
end

-- This function make Disappear the Text displayed by the display value function 
local function  disappear_text()
 
    -- it decolors all the text and its values to the black color.
	CORRECT_TEXT:setFillColor (0,0,0);
	INCORRECT_TEXT:setFillColor (0,0,0);
	timeText:setFillColor (0,0,0);
	timeVal:setFillColor (0,0,0);
	correct_value:setFillColor (0,0,0);
	incorrect_value:setFillColor (0,0,0);
	
end
-- This function makes the final score appear on the screen.
local function final_score()
 local barH = 400;
	bar = display.newRect(display.contentCenterX, display.contentCenterY, 400, 200);
    bar:setFillColor(1,1,1);
 -- displaying the Final Response time 
    timeText = display.newText ("Response time:", 150, 160, native.systemFont, 30);
	timeText:setFillColor (1,0,1);
	timeVal1 = display.newText (timevalue, 260, 190, native.systemFont, 20);
	timeVal1:setFillColor (1,0,1);
-- Displaying the final number of the correct taps
	CORRECT_TEXT = display.newText ("Correct tap :", 150, 230,native.systemFont, 30);
	CORRECT_TEXT:setFillColor (0,0,1);
	correct_value = display.newText (correct, 240,230 , native.systemFont, 20);
	correct_value:setFillColor (0,0,1);
--Displaying the final incorrect taps made
	INCORRECT_TEXT = display.newText ("Incorrect tap:",150, 300,native.systemFont, 30);
	INCORRECT_TEXT:setFillColor (1,0,0);
	incorrect_value = display.newText (incorrect, 250, 300, native.systemFont, 20);
	incorrect_value:setFillColor (1,0,0);
	radioGroup = display.newGroup()

end

-- This fuction is the event listener function called when the "i am ready " box is tapped

-- This function displays the "iam ready" text box

function start() 

Display_Text(); -- call the function Display text
startgame = 1; -- start the game using this flag
	
end
-- this function used to stop the game after the 10 round 
 local function stop()
 if round == 11 then  -- when the 10 rounds are finished for the 11th round stop the game
 timer.cancel(appear) -- cancel the timer appear
 disappear_text();  -- call the funtion to disappear to disappear the text.
 final_score();-- call the function final_score to display the final score of the game
 print(count)
 end
 end
 
 -- This this the event listener called when the Red or blue box is tapped.
local function callbackFunction (event)

 touch_start = system.getTimer(); -- starts the syatem timer when the box is tapped.
 
 if index== 1 then -- if the color of the box tapped is blue 
 correct = correct +1; -- increment the correct tap value.
 correct_value.text = correct; -- display the correct value in the text.
 else  -- condition when the tapped box is red
 incorrect = incorrect +1; --increment the incorrect value 
 incorrect_value.text = incorrect; -- display incorret value in the text.
 end

 if index == 1 then -- calculate the average response only if the box is blue
 -- calculation of the response time in seconds.
 response_time = (touch_start - application_start)/1000;  
 print(response_time);
 Total_response_time = Total_response_time + response_time;
 count = count + 1;
 average_response_time = Total_response_time / count;
  print(average_response_time);

 end
 
 timevalue = math.round(average_response_time *100)*.01; -- rounding off the time for the two decimals
 timeVal.text = timevalue; --update the time every time. 
 --print(average_response_time);
 
	if event.phase == "began" then -- when the phase is began 
		event.target:removeSelf(); -- remove the box
		Rect_Position = nil; -- make the Rect_postion box value to nil
		local result = timer.pause(Disappear ); -- pause the timer.pause function
	end 
end 

-- This function is called to disappear the boxes if it is not tapped for 2sec
local function disappear ()
local disapper = system.getTimer();
    measure = (application_start - disapper)/1000;
	print (measure);
 if (Rect_Position ~= nil) then
	--print(Rect_Position)
	Rect_Position:removeSelf();
	Rect_Position = nil;
 end
end

-- This function is to create boxes when ever the timer is called. 
local function Create_Rectangle_boxes()
  if startgame == 1 then -- flag that indicate the start of the game
  if Rect_Position == nil then -- if the box is nil
		round = round + 1;     -- increament the round 
		stop();
		if round ~= 11  then -- if the round is 10 dont create the box
			application_start = system.getTimer(); -- starts the timer when the application is started
			--print(application_start);
			random_x_Position = math.random(100,display.contentWidth-100); --randomise the x-position of the box
			random_y_Position = math.random(100,display.contentHeight-100);--randomise the y-position of the box
			size = math.random(80,150); -- randomize the size of the box
			Rect_Position = display.newRect( random_x_Position,random_y_Position, size, size);-- creating the rectangle
			index = math.random(0,1); -- index = 0 indicate red color , index = 1 indicate blue color.
				if index == 0 then
				Rect_Position: setFillColor(1,0,0); -- fill red color
				else 
				Rect_Position: setFillColor(0,0,1); -- fill blue color
				end
			Disappear = timer.performWithDelay(2000,disappear); -- disapper the box after the 2 seconds delay
			
			Rect_Position:addEventListener("touch", callbackFunction); -- call event listener function
		end
	 end
 end
end

function main() -- main function includes access to all other functions
start()
end
main(); -- calling main function
appear = timer.performWithDelay(math.random(500,5000),Create_Rectangle_boxes,0); -- calls the create box function between 500ms to 5000ms time
  
	
	
return scene;