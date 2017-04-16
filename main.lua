-- Hi! so your reading this, wich is nice, maybe you find some bugs in here, just but them in a little jar and throw them out of the window. In fact that you are reading this you shoukd be able to do this
-- i mean c'mon Lua/Löve isn't this hard if even i could wrorte that peace of garbage in less the a few weaks so feel free to change whatever you want. If you publish this somwere it would be cool to give
-- credit to me, but hey i am just a comment, not the police.
require("3ds")
if love.system.getOS() ~= "3ds" then
	love.math.setRandomSeed(os.time()) -- To make random things actualle random... a bit... a little bit more at least. Doesn't work on 3ds
end
---------------------------------------
function love.load()


	-- Load all Graphics ... Yeah :-/
	start_top = love.graphics.newImage( "grafiken/menue_top.png")
	about_top = love.graphics.newImage( "grafiken/about_top.png")
	quit_top = love.graphics.newImage( "grafiken/quit_top.png")
	
	men_start = love.graphics.newImage( "grafiken/men_start.png")
	men_start_g = love.graphics.newImage( "grafiken/men_start_g.png")
	men_info = love.graphics.newImage( "grafiken/men_info.png")
	men_info_g = love.graphics.newImage( "grafiken/men_info_g.png")
	men_quit = love.graphics.newImage( "grafiken/men_quit.png")
	men_quit_g = love.graphics.newImage( "grafiken/men_quit_g.png")
	
	pause_topimg = love.graphics.newImage( "grafiken/pause_top.png")
	pause_bottomimg = love.graphics.newImage( "grafiken/pause_bottom.png")
	speed_go = love.graphics.newImage( "grafiken/speed_go.png")
	
	go_top = love.graphics.newImage( "grafiken/gameover_top.png")
	go_bottom	= love.graphics.newImage( "grafiken/gameover_bottom.png")
	
	konfetti_bg = love.graphics.newImage( "grafiken/konfetti_bg.png")
	
	astro_bg = {}
	astro_bg[1] = love.graphics.newImage( "grafiken/astro_1.png")
	astro_bg[2] = love.graphics.newImage( "grafiken/astro_2.png")
	astro_bg[3] = love.graphics.newImage( "grafiken/astro_3.png")
	astro_bg[4] = love.graphics.newImage( "grafiken/astro_4.png")
	astro_bg[5] = love.graphics.newImage( "grafiken/astro_5.png")
	astro_bg[6] = love.graphics.newImage( "grafiken/astro_6.png")
	astro_bg[7] = love.graphics.newImage( "grafiken/astro_7.png")
	astro_bg[8] = love.graphics.newImage( "grafiken/astro_8.png")

	
	topguihead = love.graphics.newImage( "grafiken/top_headbg_px.png" )
	bottomguiline = love.graphics.newImage( "grafiken/bottomlinebg.png")
	life = love.graphics.newImage( "grafiken/life.png")
	
	heart = love.graphics.newImage( "grafiken/heart.png")
	shield_img = love.graphics.newImage( "grafiken/shield.png")
	boost_img = love.graphics.newImage( "grafiken/boost.png")
	
	fow_top = love.graphics.newImage( "grafiken/fow_top.png")
	fow_bottom = love.graphics.newImage( "grafiken/fow_bottom.png")
	
	-- Lets name your Skill
	rank = {} -- Rank  Titles for Score -- I gave up that color stuff, looked like crap so....
	rank[1] = "Lead"			-- Grey
	rank[2] = "Bronze"			-- Bronze
	rank[3] = "Silver"			-- Light Grey
	rank[4] = "Gold"			-- Gold
	rank[5] = "Platin"			-- Near White
	rank[6] = "Shinybronze"		-- Bronze / With shiny effect
	rank[7] = "Shinysilver"		-- Light Grey / With shiny effect
	rank[8] = "Shinygold"		-- Gold / With shiny effect 
	rank[9] = "Godlikeplatin"	-- Near White / With shiny effect
	title = {} -- Rank Title for Multiplicator
	title[1] = "Noob"
	title[2] = "Junior"						--combo collector
	title[3] = "Average"
	title[4] = "Bachelor"
	title[5] = "Master"
	title[6] = "Senior"
	title[7] = "Professional"
	title[8] = "King"
	title[9] = "God"
	
	-- Load all Fonts.. All two Fonts, can you imagen the amount of two ? me neighter
	fontsmall = love.graphics.newFont("pixel.ttf", 20)
	fontbig = love.graphics.newFont("pixel.ttf", 30)
	
	--load fancy audio stuff
	bg_music = love.audio.newSource( "audio/background.ogg", "static" ) --damn can not use background musik =( could have be so cool
	bg_music:setLooping( true ) --so it doesnt stop
	bg_music:setVolume(0.3)
	--nothing = love.audio.newSource( "audio/speed_punk.wav", "stream" ) didnt work -.-

	
	nm_sound = {} -- Need to do this like that cause :clone is not working :-(
	nm_sound[1] = love.audio.newSource("audio/nm.ogg", "static")
	nm_sound[2] = love.audio.newSource("audio/nm.ogg", "static")
	nm_sound[3] = love.audio.newSource("audio/nm.ogg", "static")
	nm_sound[4] = love.audio.newSource("audio/nm.ogg", "static")
	nm_sound[5] = love.audio.newSource("audio/nm.ogg", "static")
	nm_sound[6] = love.audio.newSource("audio/nm.ogg", "static")
	nm_sound[7] = love.audio.newSource("audio/nm.ogg", "static")
	
	block_sound = {} -- Need to do this like that cause :clone is not working :-(
	block_sound[1] = love.audio.newSource("audio/block.ogg", "static")
	block_sound[2] = love.audio.newSource("audio/block.ogg", "static")
	block_sound[3] = love.audio.newSource("audio/block.ogg", "static")
	block_sound[4] = love.audio.newSource("audio/block.ogg", "static")
	block_sound[5] = love.audio.newSource("audio/block.ogg", "static")
	block_sound[6] = love.audio.newSource("audio/block.ogg", "static")
	block_sound[7] = love.audio.newSource("audio/block.ogg", "static")
	
	item_sound = {}
	item_sound[1] = love.audio.newSource("audio/item.ogg", "static")
	item_sound[2] = love.audio.newSource("audio/item.ogg", "static")
	item_sound[3] = love.audio.newSource("audio/item.ogg", "static")
	
	menue_sound = {}
	menue_sound[1] = love.audio.newSource("audio/menue.ogg", "static")
	menue_sound[2] = love.audio.newSource("audio/menue.ogg", "static")
	menue_sound[3] = love.audio.newSource("audio/menue.ogg", "static")
	
	start_sound = love.audio.newSource("audio/start.ogg", "static")
	
	
	-- Gamestate and Menue Stuff ... That will make this an even bigger Mess, but hey, things getting final yeeeeeeeeeeeeaah!!!!
	pause = false --This is the pause indicator
	gamestate = "menue" -- Gamestate, Menue, Game, Scorescreen
	gamemode = "classic" -- The Gamemode, Classic; with Events Activated, Clean; Without Events and Items
	menue_point = 1 -- The Menuepoint, Can be 1(StartGame),2(Infoscreen),3(Quitgame)
	mode_y = 171 -- This is where the GameMode "Dot" is drawn
	
	-- everything for the menue background animation
	block_speed = 100 -- Blockspeed Default. Should be 100. Max should be 250. Is here for menue animation
	score = 0 -- Well yep, thats the all mighty Gamescore. Is here for menu animation, needs to be reset after game fail
	bgy1 = 0 -- Background Y position. Is here for mnue animation
	ms = 5 -- Motion Shift The less,the stronger
	ps = 10  -- Player Size
	px = 160-(ps/2) -- Player Position X
	
	
	
	--f = assert(io.open("game/hs/hs_classic.txt", "w"))
	--f:write(13579)
	--f:close()
	-- Load the Highscores, that was the fuckest up part ever, takes me like full 3 day to get this shit to work. But hey, here it is, pretty easy nah?
	if love.system.getOS() == "3ds" then
		f = assert(io.open("hs/highscore_cla.txt", "r"))
		highscore_cla = tonumber(f:read())
		f:close()
		f = assert(io.open("hs/multi_hs_cla.txt", "r"))
		multi_hs_cla = tonumber(f:read())
		f:close()
		f = assert(io.open("hs/highscore_cle.txt", "r"))
		highscore_cle = tonumber(f:read())
		f:close()
		f = assert(io.open("hs/multi_hs_cle.txt", "r"))
		multi_hs_cle = tonumber(f:read())
		f:close()
	else
		highscore_cla = 0
		multi_hs_cla = 0
		highscore_cle = 0
		multi_hs_cle = 0
	end

	--testvar = 0
	
	--if love.system.getOS() == "3ds" then
	--f = love.filesystem.newFile("hs/hs_classic.txt")
	--f:open("w")
  --  f:write("54321")
	--f:close()
	--	love.filesystem.write("hs.hs_classic.lua","54321")
	--	testvar = love.filesystem.read("hs.hs_classic.lua")
		--testvar:gmatch("%d+")
		--highscore_cla = 0
	--	multi_hs_cla = 0
	--	highscore_cle = 0
	--	multi_hs_cle = 0
	--else
	-- If Its posible to Load/save stuff
	--highscore_cla = 0
--	multi_hs_cla = 0
--	highscore_cle = 0
--	multi_hs_cle = 0
	--end


	

end -- End Load
---------------------------------------



---------------------------------------
function love.keypressed(key)
	
	p_key = key
	if gamestate == "menue" then
	
		-- This is for choosing the menue point
		if key == "left" or key == "lbutton" or key == "dleft"  then
			if menue_point > 1 then
				menue_point = menue_point -1
				play_menue_sound()
			end
		elseif key == "right" or key == "rbutton" or key == "dright"  then
			if menue_point < 3 then
				menue_point = menue_point +1
				play_menue_sound()
			end
		end

		
		if key == "up" or key == "dup"  then
			if menue_point == 1 then
				if mode_y ~= 171 then
					play_menue_sound()
					gamemode = "classic"
					mode_y = 171
				end
			end
		elseif key == "down" or key == "ddown" then
			if menue_point == 1 then
				if mode_y ~= 209 then
					gamemode = "clean"
					mode_y = 209
					play_menue_sound()
				end
			end
		end

		-- Menue functions
		if menue_point == 1 and key == "a" then
			gamestate = "game"
			pause = false
			start_sound:play()
			bg_music:play() -- Adding Fance background music
			
-- Now here goes every loadable Variable in now... So time to save everything befor messig up all the cool stuff
						-- Displayed, Interactiv Content Stuff
			ps = 10  -- Player Size
			px = 160-(ps/2) -- Player Position X
			py = 200	-- Player Position Y
			p_speed = 125 -- Player Movement speed
			
			x = {}  -- Block Positions X
			y = {}  -- Block Positions Y
			block_size = 16 -- Size of the Blocks  16
			show_block = true
			bs = {} -- Screen to display the Block
			bcr = {} -- Block Color red
			bcg = {} -- Block Color green
			bcb = {} -- Block Color blue
			
			nmx = {} --NearMiss Position X
			nmy = {} --NearMiss Position Y
			nm_size = block_size*2 -- Size of the NearMiss Blocks. Should be at least ~ block x2
			show_nm = true
			nms = {} -- Screen to display the Block
			nmcr = {} -- Near Miss Color red
			nmcg = {} -- Near Miss Color green
			nmcb = {} -- Near Miss Color Blue
			
			-- Collectebles
			coll_size = 20 -- Size ob the Collecteble, should be for everyone the same
			coll_freq_min = 1000 -- Minimum Respawn Position ( Gets Negativ) for random factor
			coll_freq_max = 2000 -- Maximum Respawn Position ( Gets Negativ) for random factor
			
			-- Sweet Heart
			x_heart = love.math.random( 0, 400 )  
			y_heart = 1000
			heart_screen = "bottom"
			show_heart = true
			heart_blink = 0 -- To make the hearts blink if you can nearly see the light
			
			-- Heavy Shield
			x_shield = love.math.random( 0, 400 ) 
			y_shield = 1000
			shield_screen = "bottom"
			shield = false -- default false
			shield_time = 0
			
			-- Boooooom
			x_boost = love.math.random( 0, 400 ) 
			y_boost = 1000
			boost_screen = "bottom"
			boost = false -- If boost Active, so if "A" ist pressed default = false
			boost_time = 3 -- Amount of boost you have in seconds
			
			
			-- Event Stuff... No idea were to start...
			next_event = 0 -- As the name says, time to next event
			--event_time = 0	-- how long a Event last
			event_name = "" -- NAme of the Event
			event_id = 1 -- The ID of the Event, for random stuff and stuff like stuff 
			event = false -- True ff Event is Activ

			
			-- Gameplay and Scoring Stuff
			lifes = 10 -- The lifes you have, you should keep them 
			score = 0 -- Well yep, thats the all mighty Gamescore
			best_multi = 0
			multi = 1 -- Even cooler, Thats the Multipliyer
			combo = false -- If combo is activated
			combocount = 0
			ms = 5 -- Motion Shift The less,the stronger
			timec = 0 -- Timestuff for funky player color
			block_speed = 100 -- Blockspeed Default. Should be 100. Max should be 250
			block_amount = 30 -- It says "block_amount" so what do you except this is ?
			blink = 0 -- Blink effect for Event
			
			
			-- Button Mapping, needs to be done to fuck up player during event muhahahaha
			l_key1 = "lbutton"
			l_key2 = "left"
			r_key1 = "rbutton"
			r_key2 = "right"
			
			--Background stuff
			bgy1 = 0 -- Background Y position
			
			astro_x = love.math.random( 0, 320 )  -- -80 Cause 80 is the size of the astros, they would just spawn outside if not
			astro_y = 1000 -- Start position of the Astroid stuff -- Needs to be this height, cause weird 3ds bug you know ... 
			astro_layer = "bottom"
			curr_astro = love.math.random( 1, 8 )
			
			
			
			for i = 1, block_amount do
			
				x[i] = love.math.random( 0-200/ms, 400-block_size-200/ms ) -- More an example... let the objects only spawn only in the screen... not perfectly, put perfect enough
				--y[i] = - love.math.random( 0, 480 ) -- First Y Position // Doubble hight for "no waves"
				y[i] = 500 -- Let the spawn were the respawn at the same moment. Seems like a LövePotion Bug or somesthing
				
				bs[i] = "bottom"				   --  Block Screen / Screen to display the block
				bcr[i] =  love.math.random( 1, 255 ) -- Block Color 1
				bcg[i] =  love.math.random( 1, 255 ) -- Block Color 2
				bcb[i] =  love.math.random( 1, 255 ) -- Block color 3
				
				nms[i] = "bottom"
				nmx[i] = x[i]-nm_size/4
				nmy[i] = y[i]
				nmcr[i] =  love.math.random( 1, 255 ) -- NearMiss Color 1
				nmcg[i] =  love.math.random( 1, 255 ) -- NearMiss Color 2
				nmcb[i] =  love.math.random( 1, 255 ) -- NearMiss color 3
			
			end
	
		end
		-- Quit GAME
		if menue_point == 3 and key == "a" then
							--Save Stuff
			if love.system.getOS() == "3ds" then
				f = assert(io.open("hs/highscore_cla.txt", "w"))
				f:write(highscore_cla)
				f:close()
				f = assert(io.open("hs/multi_hs_cla.txt", "w"))
				f:write(multi_hs_cla)
				f:close()
				f = assert(io.open("hs/highscore_cle.txt", "w"))
				f:write(highscore_cle)
				f:close()
				f = assert(io.open("hs/multi_hs_cle.txt", "w"))
				f:write(multi_hs_cle)
				f:close()
			end
		
			love.event.quit()
		end
	end
	-- Stuff for pause
	if gamestate == "game" then
		if key == "start" or key == "p" then
			if pause then
				pause = false
				bg_music:play()
			else
				pause = true
				bg_music:stop() ---Fuckig fuck of a fucking duck, who implements stop but not pause ??? 
			end

		end
	end
	if pause and key == "x" then
		gamestate = "menue"
	end
	if gamestate == "gameover" and key == "x" then
		gamestate = "menue"
	end
	
	
	-- Dick Quit Move, should be late done over Menue
	--if key == "i" then
	--	love.event.quit()
	--end

end  -- End KeyCheck
---------------------------------------

-- Audio Stuff

-- Menue Sound
function play_menue_sound()
	i = 1
	while i <= 3 do
        if not menue_sound[i]:isPlaying() then
            menue_sound[i]:play()
            return
        end
		i = i+1
	end
end

-- Near Miss sound
function play_block_sound()
	i = 1
	while i <= 7 do
        if not block_sound[i]:isPlaying() then
            block_sound[i]:play()
            return
        end
		i = i+1
	end
end

-- Near Miss sound
function play_nm_sound()
	i = 1
	while i <= 7 do
        if not nm_sound[i]:isPlaying() then
            nm_sound[i]:play()
            return
        end
		i = i+1
	end
end

-- Near Miss sound
function play_item_sound()
	i = 1
	while i <= 3 do
        if not item_sound[i]:isPlaying() then
            item_sound[i]:play()
            return
        end
		i = i+1
	end
end





--------------------------------------------



---------------------------------------
function love.update(dt)


	if gamestate == "menue" then
		pause = true
		
		
		-- This ist just for the Moving Pixels on the Main Menue Screen !!
		-- Lets things get fast very quick
		--if block_speed <= 250 then
		--	block_speed = 100*(1+(score/30000)) -- Should be /30000
		--elseif block_speed >= 250 and boost == false then
		--	block_speed = 250
		--end
		
		block_speed = 100 -- So it has Normal speed in the Menue
		
		-- Background Movments. That just totally sucks, what the fuck is the god damn promlem of LövePotion not doing this the normal/easy way ?!
		bgy1 = bgy1+(block_speed*dt)%240/3 -- If not working try : bgy1 = bgy1+(block_speed*dt)%240/3
		
		if bgy1 >= 240 then
			bgy1 = bgy1-240
		end
	
	end

	if gamestate == "gameover" then
		
	
		-- To make the Score Blink if new Highscore was set in Gameover mode.... and yes i stole all Vars, from heartblink because i'm to lazy to set new ones
		if gamemode == "classic" then
			if score >= highscore_cla then
				heart_blink = heart_blink+1
			else
				show_heart = false
			end
		elseif gamemode == "clean" then
			if score >= highscore_cle then
				heart_blink = heart_blink+1
			else
				show_heart = false
			end
		else
			show_heart = false
		end
		if heart_blink == 20 then
			show_heart = true
		elseif heart_blink == 40 then
			show_heart = false
		elseif heart_blink == 60 then
			heart_blink = 0
		end
	
	end


	
	--Gamestate GAME  so here is everything with the game, so basicly everything that needs to work.
	if pause == false then

	
				-- Lets things get fast very quick
		if block_speed <= 250 then
			block_speed = 100*(1+(score/30000)) -- Should be /30000
		elseif block_speed >= 250 and boost == false then
			block_speed = 250
		end
		
		-- Background Movments. That just totally sucks, what the fuck is the god damn promlem of LövePotion not doing this the normal/easy way ?!
		bgy1 = bgy1+(block_speed*dt)%240/3 -- If not working try : bgy1 = bgy1+(block_speed*dt)%240/3
		
		if bgy1 >= 240 then
			bgy1 = bgy1-240
		end


		
		
		
		-- Pixel Astroid stuff (also background stuff..)
		astro_y =astro_y+(block_speed*dt)/2
		
		if astro_y >= 550 then -- 550 = 2xSCREEN_HEIGHT+50/SCREENGAP
			astro_y = - love.math.random( 0, 1000 )
			astro_x = love.math.random( 0, 320 )
			al_id = love.math.random( 1, 2 )
			curr_astro = love.math.random( 1, 8 )
			if al_id == 1 then
				astro_layer = "bottom"
			else
				astro_layer = "top"
			end
			
		end
		
		
		
			-- Everything about the "ENEMY BLOCKS"  Put this in an extra file !!!
		i = 1
		while i <= block_amount do
			y[i] = y[i]+(block_speed*dt)
			nmy[i] = y[i]-nm_size/4
			i = i+1
		end
		
		-- let these basterts jump to the second screen
		i = 1
		while i <= block_amount do
		
			if y[i] >= 240+nm_size and bs[i] == "top" then
			bs[i] = "bottom"
			nms[i] = "bottom"
			y[i] = -50+nm_size/3 -- Negativ should be somthing around the space between the Displays
			end
		
		i = i+1
		end
		
		-- let these bastets respawn for an endless run
			i = 1
		while i <= block_amount do
		
			if y[i] > 280 and bs[i] == "bottom" then
			bs[i] = "top"
			nms[i] = "top"
			x[i] = love.math.random( 0-200/ms, 400-block_size-200/ms ) -- First X Position
			y[i] = - love.math.random( 0, 480 ) -- First Y Position
			nmx[i] = x[i]-nm_size/4
			nmy[i] = y[i]-nm_size/4
			end
		
		i = i+1
		end
		-- Here ends "Everything about Enemy blocks"
		
		
		if gamemode == "classic" then -- Because no Items in Clean Gamemode
			-- Here are the Collecteble Objects Like: Heart, Shield and Bomb
			
			--Make them Move
			y_heart = y_heart+(block_speed*dt)
			y_shield = y_shield+(block_speed*dt)
			y_boost = y_boost+(block_speed*dt)
			
			-- Make the Jump the Screen
			if y_heart > 260 and heart_screen == "top" then
				heart_screen = "bottom"
				y_heart = -50-coll_size/2 -- Negativ should be somthing around the space between the Displays
			end
			if y_shield > 260 and shield_screen == "top" then
				shield_screen = "bottom"
				y_shield = -50-coll_size/2 -- Negativ should be somthing around the space between the Displays
			end
			if y_boost > 260 and boost_screen == "top" then
				boost_screen = "bottom"
				y_boost = -50-coll_size/2 -- Negativ should be somthing around the space between the Displays
			end
			
			-- Make them Respawn if the Player is to dump to collect.
			if y_heart > 280 and heart_screen == "bottom" then
				heart_screen = "top"
				y_heart = -love.math.random( coll_freq_min, coll_freq_max )
				x_heart = love.math.random( 0, 400 ) -- New X Position
			end
			if y_shield > 280 and shield_screen == "bottom" then
				shield_screen = "top"
				y_shield = -love.math.random( coll_freq_min*3, coll_freq_max*3 )
				x_shield = love.math.random( 0, 400 ) -- New X Position
			end
			if y_boost > 280 and boost_screen == "bottom" then
				boost_screen = "top"
				y_boost = -love.math.random( coll_freq_min, coll_freq_max )
				x_boost = love.math.random( 0, 400 ) -- New X Position
			end
		
		end
		
		
		
		-- Moving the awesome Player block 
		timec = timec + dt -- Timestuff for funky player Color
		if love.keyboard.isDown(l_key1) or love.keyboard.isDown(l_key2) then
			if px >= 0 then  -- For Left end Collision
				px = px-(p_speed*dt)
			end
		end
		if love.keyboard.isDown(r_key1) or love.keyboard.isDown(r_key2) then
			if px <= 320-ps then -- For right end Collision
				px = px+(p_speed*dt)
			end
		end
		
		if gamemode == "classic" then
			-- Activating Boost
			if love.keyboard.isDown("b") then
				if boost_time > 0 then
						block_speed = 350
						boost = true
						boost_time = boost_time-1*dt
				else
					boost = false -- just to be sure... had a lot of bugs about that
				end
			
			else
				if block_speed <= 250 then
					block_speed = 100*(1+(score/30000)) -- Should be /30000
				elseif block_speed >= 250 and boost == false then
					block_speed = 250
				end	
				boost = false
			end
		end
		
		-- Collision Part.. Duh things getting complicated here
		i = 1
		while i <= block_amount do
		-- Enemy Collision
			
			if px < x[i]-40+(px/ms)+block_size and x[i]-40+(px/ms) < px+ps  and py < y[i]+block_size and y[i] < py+ps and bs[i] == "bottom" then
			
				-- Let Stuff Spawn back again after hitting one of these squad dudes
				bs[i] = "top"
				nms[i] = "top"
				x[i] = love.math.random( 0-200/ms, 400-block_size-200/ms ) -- First X Position
				y[i] = - love.math.random( 0, 480 ) -- First Y Position
				nmx[i] = x[i]-nm_size/4
				nmy[i] = y[i]-nm_size/4
				
				--Cool shield function
				if shield == false then
					play_block_sound()
					--combo = false -- Reset the Combocounter
					lifes = lifes-1 -- Aww don't cry, you only lost a life 
					combocount = 0 -- Same above
					multi = 1 -- Reset Multipladings (English is pretty hard sometimes)
				end

			end
			
			if px < nmx[i]-40+(px/ms)+nm_size and nmx[i]-40+(px/ms) < px+ps  and py < nmy[i]+nm_size and nmy[i] < py+ps and nms[i] == "bottom" then
				nmx[i] = -200 -- Hide Near Miss after hitting
				nmy[i] = -200 -- Read Text Above
				play_nm_sound() -- Play Cool sound
				-- Stuff for Combotiming
				combo = true
				if combo then
					multi = multi+1
					combocount = combocount+1 -- Comb Sounter time
					if multi > best_multi then -- Creating a Best Multi
						best_multi = multi
					end
					if gamemode == "classic" then
						if multi > multi_hs_cla then -- Creating a Multi Highscore
							multi_hs_cla = multi	
						end
					elseif gamemode == "clean" then
						if multi > multi_hs_cle then -- Creating a Multi Highscore
							multi_hs_cle = multi
						end
					end
				end
				score = score+10*multi
				if gamemode == "classic" then
					if score > highscore_cla then	-- For creating an Highscore
						highscore_cla = score
					end
				elseif gamemode == "clean" then
					if score > highscore_cle then	-- For creating an Highscore
						highscore_cle = score
					end
				end
			end
		
			i = i+1
		end
		
		-- You want this to happen
		if lifes == 0 then
			gamestate = "gameover"
			pause = true
			bg_music:stop()     -- Does NOT work on fxcking LövePotion even it's implemented !!!
			--bg_music:setVolume(0)
		end
		
		if gamemode == "classic" then
			-- Heart Collision
			if px < x_heart-40+(px/ms)+coll_size and x_heart-40+(px/ms) < px+ps  and py < y_heart+coll_size and y_heart < py+ps and heart_screen == "bottom" then
				x_heart = love.math.random( 0, 400 ) -- Hide Near Miss after hitting
				y_heart = -love.math.random( coll_freq_min, coll_freq_max )
				heart_screen = "top"
				if lifes <= 9 then
					lifes = lifes+1
					play_item_sound()
				elseif lifes == 10 then
					score = score+100*multi
					play_item_sound()
				end
			end
			-- Shield Collision
			if px < x_shield-40+(px/ms)+coll_size and x_shield-40+(px/ms) < px+ps  and py < y_shield+coll_size and y_shield < py+ps and shield_screen == "bottom" then
				x_shield = love.math.random( 0, 400 )
				y_shield = -love.math.random( coll_freq_min*3, coll_freq_max*3 )
				shield_screen = "top"
				play_item_sound()
				shield = true
				shield_time = 7
			end
			-- Boost Collision
			if px < x_boost-40+(px/ms)+coll_size and x_boost-40+(px/ms) < px+ps  and py < y_boost+coll_size and y_boost < py+ps and boost_screen == "bottom" then
				x_boost = love.math.random( 0, 400 )
				y_boost = -love.math.random( coll_freq_min, coll_freq_max )
				boost_screen = "top"
				play_item_sound()
				if boost_time < 2 then
					boost_time = 3
				else
					boost_time = 3
				end
			end
		end
		-- Timers an simmiliar Stuff
		
		-- Makes Hearts Blink i you nearly dead
		if lifes <= 3 then
			heart_blink = heart_blink+1
		else
			show_heart = true
		end
		if heart_blink == 10 then
			show_heart = true
		elseif heart_blink == 20 then
			show_heart = false
		elseif heart_blink == 30 then
			heart_blink = 0
		end
		
		
		-- Combo timer
		if combocount >= 0 then
			combocount = combocount-1*dt
		end
		if combocount <= 0 then
			combocount = 0 --So there are no negativ Numbers, they look like crap
			combo = false
			multi = 0
		end
		
		if gamemode == "classic" then
			-- Shield timer
			if shield_time >= 0 then
				shield_time = shield_time-1*dt
				shield = true
			end
			if shield_time <= 0 then
				shield_time = 0 --So there are no negativ Numbers, they look like crap
				shield = false
			end
		end
		
		if gamemode == "classic" then
			-- All about Events goes here, hopefully ...
			-- Event Timer
			next_event = next_event+1*dt
			if next_event >= 45 and event == false  then
				event = true
				--next_event = 60
				event_id = love.math.random( 1, 11 )
			elseif next_event >= 60 then
				next_event = 0
				event_id = 1
				event = false
			end
			-- Event List
			if event_id == 1 then
			 -- No Event, Good place to reset the Mess
				event_name = "NOTHING ?!"
				ps = 10
				p_speed = 125
				l_key1 = "lbutton"
				l_key2 = "left"
				r_key1 = "rbutton"
				r_key2 = "right"
				fow = false  -- Fog of War
				show_block = true
				show_nm = true
			elseif event_id == 2 then
				event_name = "BIG ME"
				ps = 20
			elseif event_id == 3 then
				event_name = "SUPER SHOES"
				p_speed = 250
			elseif event_id == 4 then
				event_name = "LEAD BOOTS"
				p_speed = 50
			elseif event_id == 5 then
				event_name = "ALCOHOLIC BRAIN"
				r_key1 = "lbutton"
				r_key2 = "left"
				l_key1 = "rbutton"
				l_key2 = "right"
			elseif event_id == 6 then
				event_name = "FOG OF WAR"
				fow = true
			elseif event_id == 7 then
				event_name = "INVISIBLE PIXEL"
				show_block = false
			elseif event_id == 8 then
				event_name = "INVISIBLE BORDERS"
				show_nm = false
			elseif event_id == 9 then
				event_name = "TOTAL COLLAPSE"
				blink = blink+1
				if blink == 10 then
					show_nm = true
					show_block = true
				elseif blink == 20 then
					show_nm = false
					show_block = false
				elseif blink == 30 then
					blink = 0
				end
			elseif event_id == 10 then
				event_name = "PIXEL COLLAPSE"
				blink = blink+1
				if blink == 10 then
					show_block = true
				elseif blink == 20 then
					show_block = false
				elseif blink == 30 then
					blink = 0
				end
			elseif event_id == 11 then
				event_name = "BORDER COLLAPSE"
				blink = blink+1
				if blink == 10 then
					show_nm = true
				elseif blink == 20 then
					show_nm = false
				elseif blink == 30 then
					blink = 0
				end
			end -- End Event
		end
		
	end -- end pause



end -- End Update
---------------------------------------



---------------------------------------
function love.draw()
	
	--- TOP SCREEN ---
	
	-- Background Layer Top
	love.graphics.setBackgroundColor( 10, 10, 10 ) -- Background color for stuff, should be later a fance image with pixels and shit

		-- I Think it looks pretty cool if that gets also drawn in the Main Menue
		love.graphics.setScreen("top")
		love.graphics.setColor(255,255,255 )
		love.graphics.draw(konfetti_bg ,0+(px/ms)/3, bgy1)
		love.graphics.draw(konfetti_bg ,0+(px/ms)/3, bgy1-240)
	
	if gamestate == "game" then
		
		-- Draw Astroid Stuff Top
		if astro_layer == "bottom" then
			love.graphics.setColor(255,255,255 )
			love.graphics.setScreen("top")
			love.graphics.draw(astro_bg[curr_astro] ,astro_x+(px/ms)/2, astro_y)
		end
		
		-- Background Layer Bottom
		love.graphics.setScreen("bottom")
		love.graphics.setColor(255,255,255 )
		love.graphics.draw(konfetti_bg ,0-40+(px/ms)/3, bgy1)
		love.graphics.draw(konfetti_bg ,0-40+(px/ms)/3, bgy1-240)
		
		-- Draw Astroid Stuff Bottom
		if astro_layer == "bottom" then
			love.graphics.setColor(255,255,255 )
			love.graphics.setScreen("bottom")
			love.graphics.draw(astro_bg[curr_astro] ,astro_x-40+(px/ms)/2, astro_y-290)
		end
		
		if gamemode == "classic" then
			-- Draw the Collectebles  I Have no idea why the shield needs to be drawn first, but otherwise it has strange color glitches...
			if show_nm or show_block then -- For total Collapse, it's cooler then...
				love.graphics.setColor(0,0,255 )
				if shield_screen == "top" then
					love.graphics.setScreen(shield_screen)
					love.graphics.draw(shield_img ,x_shield+(px/ms), y_shield)
				elseif shield_screen == "bottom" then
					love.graphics.setScreen(shield_screen)
					love.graphics.draw(shield_img ,x_shield-40+(px/ms), y_shield)
				end
				love.graphics.setColor(255,0,0 )
				if heart_screen == "top" then
					love.graphics.setScreen(heart_screen)
					love.graphics.draw(heart ,x_heart+(px/ms), y_heart)
				elseif heart_screen == "bottom" then
					love.graphics.setScreen(heart_screen)
					love.graphics.draw(heart ,x_heart-40+(px/ms), y_heart)
				end
				love.graphics.setColor(0,255,0 )
				if boost_screen == "top" then
					love.graphics.setScreen(boost_screen)
					love.graphics.draw(boost_img ,x_boost+(px/ms), y_boost)
				elseif boost_screen == "bottom" then
					love.graphics.setScreen(boost_screen)
					love.graphics.draw(boost_img ,x_boost-40+(px/ms), y_boost)
				end
			end
		end
		
		
			-- Draw "Near Miss"
		if show_nm then
				i = 1
			while i <= block_amount do
				love.graphics.setScreen(nms[i])
				love.graphics.setColor( nmcr[i],nmcg[i],nmcb[i] )   -- Color of Blocks
				if bs[i] == "top" then
					love.graphics.rectangle( "fill", nmx[i]+(px/ms), nmy[i], nm_size, nm_size )  -- Drawing Blocks
				elseif bs[i] == "bottom" then
					love.graphics.rectangle( "fill", nmx[i]-40+(px/ms), nmy[i], nm_size, nm_size )  -- Drawing Blocks
				end
				i = i+1
			end
		end
		--Draw "Enemys"
		if show_block then
			i = 1
			while i <= block_amount do
				love.graphics.setScreen(bs[i])
				love.graphics.setColor( bcr[i],bcg[i],bcb[i] )   -- Color of Blocks
				if bs[i] == "top" then
					love.graphics.rectangle( "fill", x[i]+(px/ms), y[i], block_size, block_size )  -- Drawing Blocks
				elseif bs[i] == "bottom" then
					love.graphics.rectangle( "fill", x[i]-40+(px/ms), y[i], block_size, block_size )  -- Drawing Blocks
				end
				i = i+1
			end
		end

		if gamemode == "classic" then
			-- Draw Shield
			if shield then
				love.graphics.setScreen("bottom")
				love.graphics.setColor( 000,000,255 )
				love.graphics.rectangle( "fill", px-3, py-3, ps+6, ps+6 )
			end
		end
		-- Daw "Player"	
		love.graphics.setScreen("bottom")
		love.graphics.setColor(math.floor((math.sin(timec))*255),math.floor(math.abs(math.sin(timec))*255),math.floor(math.abs(math.cos(timec))*255),255)
		love.graphics.rectangle( "fill", px, py, ps, ps )  -- Drawing Blocks
		
		-- Draw Astroid stuff Top Layer
			-- Draw Astroid Stuff Bottom
		if astro_layer == "top" then
			love.graphics.setColor(255,255,255 )
			love.graphics.setScreen("top")
			love.graphics.draw(astro_bg[curr_astro] ,astro_x+(px/ms)/2, astro_y)
		end
			-- Draw Astroid Stuff Bottom
		if astro_layer == "top" then
			love.graphics.setColor(255,255,255 )
			love.graphics.setScreen("bottom")
			love.graphics.draw(astro_bg[curr_astro] ,astro_x-40+(px/ms)/2, astro_y-290)
		end
		
		-- Drawing Fog of War Event
		if gamemode == "classic" then
			if fow then
				love.graphics.setColor( 255, 255, 255 )
				love.graphics.setScreen("top")
				love.graphics.draw(fow_top , 0 , 0) -- Top Screen Gui Image
				love.graphics.setScreen("bottom")
				love.graphics.draw(fow_bottom , 0 , 0) -- Top Screen Gui Image
			end
		end
		-- Drawing GUI and other sexy Stuff
		love.graphics.setScreen("top")
		if gamemode == "classic" then
			love.graphics.setColor( 0, 255, 0 )
			bp_lenght = math.ceil(220*(boost_time/3*100)/100) -- Holy shit, that was harder as i should be for a 22yo ....
			love.graphics.rectangle( "fill", 200-bp_lenght/2, 35,bp_lenght, 10 ) -- Drawing the Boost Bar
		end
		love.graphics.draw(topguihead , 0 , 0) -- Top Screen Gui Image
		
		love.graphics.setFont(fontbig)
		love.graphics.setColor( 255, 0, 0 )
		love.graphics.print("-"..score.."-", 200-(fontbig:getWidth(score.."-"))/2 , 0) -- Draw the Score 
		love.graphics.setFont(fontsmall)
		love.graphics.setColor( 255, 255, 0 )
		love.graphics.print("S: ".. math.ceil(block_speed) .."" ,10 , 4) -- Draw the Speed
		love.graphics.setColor( 0, 255, 0 )
		if gamemode == "classic" then
			if boost then
				love.graphics.print("BOOST",10 , 19)
			end
		end
		if gamemode == "classic" then
			-- Display Event and Eventtimer
			love.graphics.setColor( 255, 255, 0 )
			if event then
				love.graphics.setColor( 255, 140, 0 )
				love.graphics.print(event_name,200-(fontsmall:getWidth(event_name))/2 , 50)
			else
				love.graphics.setColor( 255, 255, 0 )
				love.graphics.print("Next Event in: ".. math.ceil(45-next_event) .."" ,200-(fontsmall:getWidth("Next Event in: ".. math.ceil(next_event) .."" ))/2  , 50)
			end
		end
		
		
		love.graphics.setColor( 255, 255, 0 )
		love.graphics.print("X ".. multi .."" ,350 , 4) -- Draws the Multipliyer
		love.graphics.print(math.floor(combocount*10)/10, 350, 22) --Draw the multipliyer time
		
		
		love.graphics.setScreen("bottom")
		love.graphics.draw(bottomguiline , 0 , 0) -- Top Screen Gui Image
		
		-- Drawing the Hearts

	-- This is what currently working the best, but still didnt know how to make a space between the hearts
		for i=1,lifes,1 do
			if show_heart then
				love.graphics.draw(life, 0.5 * love.graphics.getWidth() + (i-1-0.5*lifes) * life:getWidth(),220)
			end
		end
		
	-- Finaly, Here Goes all the Menue Stuff in, Just to Complete the Mess :-P
		if pause then
			love.graphics.setColor( 255, 255, 255 )
			love.graphics.setScreen("top")
			love.graphics.draw(pause_topimg , 0 , 0) -- Top Screen Gui Image
			love.graphics.setScreen("bottom")
			love.graphics.draw(pause_bottomimg , 0 , 0) -- Top Screen Gui Image
		
		end
	end
--------
-- Gamestat Menue Stuff... So everything that makes the game worth playing sadly
	if gamestate == "menue" then
		if menue_point == 1 then
			love.graphics.setScreen("top")
			love.graphics.setColor(255,255,255 )
			love.graphics.draw(start_top , 0 , 0) -- Main Menue Screen
			love.graphics.setColor(255,0,0 )
			love.graphics.rectangle( "fill", 170, mode_y, 14, 14 ) -- Choose Point, for gamemode
			
			love.graphics.setScreen("bottom")
			love.graphics.setColor(255,255,255 )
			love.graphics.draw(men_start_g , 6 , 0) -- Start Game IMG
			love.graphics.draw(men_info , 110 , 0) -- About Game IMG
			love.graphics.draw(men_quit , 214 , 0) -- Quit Game IMG
		elseif menue_point == 2 then
			love.graphics.setScreen("top")
			love.graphics.setColor(255,255,255 )
			love.graphics.draw(about_top , 0 , 0) -- Controlls/ About Screen
		
			love.graphics.setScreen("bottom")
			love.graphics.setColor(255,255,255 )
			love.graphics.draw(men_start , 6 , 0) -- Start Game IMG
			love.graphics.draw(men_info_g , 110 , 0) -- About Game IMG
			love.graphics.draw(men_quit , 214 , 0) -- Quit Game IMG
			
		elseif menue_point == 3 then
			love.graphics.setScreen("top")
			love.graphics.setColor(255,255,255 )
			love.graphics.draw(quit_top , 0 , 0) -- Controlls/ About Screen
		
			love.graphics.setScreen("bottom")
			love.graphics.setColor(255,255,255 )
			love.graphics.draw(men_start , 6 , 0) -- Start Game IMG
			love.graphics.draw(men_info , 110 , 0) -- About Game IMG
			love.graphics.draw(men_quit_g , 214 , 0) -- Quit Game IMG
		
		end

		
	end
	
	if gamestate == "gameover" then
		love.graphics.setScreen("top")
		love.graphics.setColor(255,255,255 )
		love.graphics.draw(go_top , 0 , 0)
		if block_speed == 250 then
			love.graphics.draw(speed_go , 155 , 122)
		end
		love.graphics.setFont(fontsmall)
		love.graphics.setColor(255,255,0 )
		love.graphics.print("Mode:",174,70)
		if gamemode == "classic" then
			love.graphics.print("Classic",166,90) -- 166,90
		elseif gamemode == "clean" then
			love.graphics.print("Clean",174, 90)
		end
		
		love.graphics.setColor( 255, 0, 0 )
		love.graphics.setFont(fontsmall)
		if show_heart then 
			love.graphics.setColor( 255, 106, 0 )
			love.graphics.print("High  ",(230*0.333)-(fontsmall:getWidth("HIGHScore: ")/2) , 4)
		end
		love.graphics.setColor( 255, 0, 0 )
		love.graphics.print("Score: ",(300*0.333)-(fontsmall:getWidth("Score: ")/2) , 4)
		love.graphics.setColor( 255, 255, 0 )
		love.graphics.setFont(fontbig)
		love.graphics.print(score,(300/3)-(fontbig:getWidth(score)/2) , 25)
		
		love.graphics.setColor( 255, 106, 0  )
		love.graphics.setFont(fontsmall)
		love.graphics.print("Highscore: ",(300*0.333)-(fontsmall:getWidth("Highscore: ")/2) , 194)
		love.graphics.setColor( 255, 255, 0 )
		love.graphics.setFont(fontsmall)
		if gamemode == "classic" then
			love.graphics.print(highscore_cla,(300/3)-(fontsmall:getWidth(highscore_cla)/2) , 212)
		elseif gamemode == "clean" then
			love.graphics.print(highscore_cle,(300/3)-(fontsmall:getWidth(highscore_cle)/2) , 212)
		end
		
		love.graphics.setColor( 255, 0, 0 )
		love.graphics.setFont(fontsmall)
		love.graphics.print("Best Combo: ",(450*0.666)-(fontsmall:getWidth("Best Combo: ")/2) , 4)
		love.graphics.setColor( 255, 255, 0 )
		love.graphics.setFont(fontbig)
		love.graphics.print("X ".. best_multi .."", (450*0.666)-(fontbig:getWidth("X: ".. best_multi .."")/2) , 25)
		
		love.graphics.setColor( 255, 106, 0  )
		love.graphics.setFont(fontsmall)
		love.graphics.print("Combo HS.: ",(450*0.666)-(fontsmall:getWidth("Combo HS. : ")/2) , 194)
		love.graphics.setColor( 255, 255, 0 )
		love.graphics.setFont(fontsmall)
		if gamemode == "classic" then
			love.graphics.print("X ".. multi_hs_cla .."", (455*0.666)-(fontbig:getWidth("X: ".. multi_hs_cla .."")/2) , 212)
		elseif gamemode == "clean" then
			love.graphics.print("X ".. multi_hs_cle .."", (455*0.666)-(fontbig:getWidth("X: ".. multi_hs_cle .."")/2) , 212)		
		end

		-- Rank and Titles
		love.graphics.setColor( 0, 255, 0 )
		love.graphics.setFont(fontsmall)
		love.graphics.print("-RANK-",43 , 70)
		love.graphics.print("-TITLE-",285 , 70)
		
		-- Score Rank
		love.graphics.setFont(fontsmall)
		love.graphics.setColor( 255, 255, 0 )
		if score <= 5000 then
			love.graphics.print(rank[1], (77)-(fontsmall:getWidth(rank[1])/2) , 100)
		elseif score >= 5000 and score < 10000 then
			love.graphics.print(rank[2], (77)-(fontsmall:getWidth(rank[2])/2) , 100)
		elseif score >= 10000 and score < 20000 then
			love.graphics.print(rank[3], (77)-(fontsmall:getWidth(rank[3])/2) , 100)
		elseif score >= 20000 and score < 30000 then
			love.graphics.print(rank[4], (77)-(fontsmall:getWidth(rank[4])/2) , 100)
		elseif score >= 30000 and score < 45000 then
			love.graphics.print(rank[5], (77)-(fontsmall:getWidth(rank[5])/2) , 100)
		elseif score >= 45000 and score < 70000 then  -- Max Speed
			love.graphics.print(rank[6], (77)-(fontsmall:getWidth(rank[6])/2) , 100)
		elseif score >= 70000 and score < 100000 then
			love.graphics.print(rank[7], (77)-(fontsmall:getWidth(rank[7])/2) , 100)
		elseif score >= 100000 and score < 150000 then
			love.graphics.print(rank[8], (77)-(fontsmall:getWidth(rank[8])/2) , 100)
		elseif score >= 150000 then
			love.graphics.print(rank[9], (77)-(fontsmall:getWidth(rank[9])/2) , 100)
		end
		
		-- Combo Title
		love.graphics.setFont(fontsmall)
		love.graphics.setColor( 255, 255, 0 )
		if best_multi < 10 then
			love.graphics.print(title[1], (325)-(fontsmall:getWidth(title[1])/2) , 100)
		elseif best_multi >= 10 and best_multi < 15 then
			love.graphics.print(title[2], (325)-(fontsmall:getWidth(title[2])/2) , 100)
		elseif best_multi >= 15 and best_multi < 20 then
			love.graphics.print(title[3], (325)-(fontsmall:getWidth(title[3])/2) , 100)
		elseif best_multi >= 20 and best_multi < 25 then
			love.graphics.print(title[4], (325)-(fontsmall:getWidth(title[4])/2) , 100)
		elseif best_multi >= 25 and best_multi < 35 then
			love.graphics.print(title[5], (325)-(fontsmall:getWidth(title[5])/2) , 100)
		elseif best_multi >= 35 and best_multi < 50 then  -- Max Speed
			love.graphics.print(title[6], (325)-(fontsmall:getWidth(title[6])/2) , 100)
		elseif best_multi >= 50 and best_multi < 80 then
			love.graphics.print(title[7], (325)-(fontsmall:getWidth(title[7])/2) , 100)
		elseif best_multi >= 80 and best_multi < 100 then
			love.graphics.print(title[8], (325)-(fontsmall:getWidth(title[8])/2) , 100)
		elseif best_multi >= 100 then
			love.graphics.print(title[9], (325)-(fontsmall:getWidth(title[9])/2) , 100)
		end
		
		
		love.graphics.setScreen("bottom")
		love.graphics.setColor(255,255,255 )
		love.graphics.draw(go_bottom , 0 , 0)
	
	end
	
-- Debugg Stuff
--testvar = os.time()

	--love.graphics.print(highscore_cla, 10, 10)
	--love.graphics.print(testvar, 10, 25)
	--love.graphics.print(testvar:gsub(".", function(x) return ("%x"):format(x:byte()) end), 10, 25)

--love.graphics.print(bgy2, 10, 25)




	

end -- End Draw
---------------------------------------


-- Note to myself, give credit to "Aconitin" and "Shell32" for awesome IRC help

