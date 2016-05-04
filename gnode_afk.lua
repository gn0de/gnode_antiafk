CreateClientConVar( "gnode_antiafktimer", 5 ) -- basically concommand.Add()
local aafkon = 0 -- turns the command to zero by default
local function aafkm( )
	draw.SimpleText( "ANTI AFK MODE IS ON! \n Run the consolecommand gnode_antiafk to turn it off", ScrW()*.1, ScrH()*.5, Color( 255,0,0 ) ) -- Message on lua_openscript_cl
end
local movements = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } -- diffrent movement types
local function move1( )
	RunConsoleCommand( "+forward" )
	LocalPlayer():ConCommand( "act cheer" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-forward" )
	end )
end
local function move2( )
	RunConsoleCommand( "+left" )
	RunConsoleCommand( "+back" )
	LocalPlayer():ConCommand( "act laugh" )
	timer.Simple(.5, function()
		RunConsoleCommand( "-left" )
		RunConsoleCommand( "-back" )
	end )
end
local function move3( )
	RunConsoleCommand( "+back" )
	LocalPlayer():ConCommand( "act muscle" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-back" )
	end )
end
local function move4( )
	RunConsoleCommand( "+right" )
	RunConsoleCommand( "+forward" )
	LocalPlayer():ConCommand( "act robot" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-right" )
		RunConsoleCommand( "-forward" )
	end )
end
local function move5( )
	RunConsoleCommand( "+moveright" )
	LocalPlayer():ConCommand( "act zombie" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-moveright" )
	end )
end
local function move6( )
	RunConsoleCommand( "+back" )
	LocalPlayer():ConCommand( "act robot" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-back" )
	end )
end
local function move7( )
	RunConsoleCommand( "+right" )
	RunConsoleCommand( "+moveleft" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-right" )
		RunConsoleCommand( "-moveleft" )
		LocalPlayer():ConCommand( "act dance" )
	end )
end
local function move8( )
	RunConsoleCommand( "+jump" )
	RunConsoleCommand( "+duck" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-jump" )
		RunConsoleCommand( "-duck" )
		LocalPlayer():ConCommand( "act agree" )
	end )
end
local function move9( )
	RunConsoleCommand( "+attack" )
	LocalPlayer():ConCommand( "act becon" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-attack" )
	end )
end
local function move10( )
	RunConsoleCommand( "+zoom" )
	LocalPlayer():ConCommand( "act disagree" )
	timer.Simple( .5, function( )
		RunConsoleCommand( "-zoom" )
	end )
end
local function antiafk( )
	if aafkon == 0 then
		timer.Create( "antiafk", GetConVarNumber( "gnode_antiafktimer" ), 0, function( )
			local grm = table.Random( movements )
			if grm == 1 then
				move1( )
			elseif grm == 2 then
				move2( )
			elseif grm == 3 then
				move3( )
			elseif grm == 4 then
				move4( )
			elseif grm == 5 then
				move5( )
			elseif grm == 6 then
				move6( )
			elseif grm == 7 then
				move7( )
			elseif grm == 8 then
				move8( )
			elseif grm == 9 then
				move9( )
			elseif grm == 10 then
				move10( )
			end
		end )
		aafkon = 1
	elseif aafkon == 1 then
		timer.Destroy( "antiafk" )
		hook.Remove( "HUDPaint", "aafkpaint" )
		aafkon = 0
	end
end
concommand.Add( "gnode_antiafk", antiafk )