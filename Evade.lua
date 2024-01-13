--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.19) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local WorkspacePlayers = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\230\204\201\46\245\171\198\29\212", "\126\177\163\187\69\134\219\167")).Game.Players;
local players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\19\193\43\220\249\49\222", "\156\67\173\74\165"));
local localPlayer = players.LocalPlayer;
local UserInputService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\1\164\76\4\149\40\86\33\163\122\19\174\48\79\55\178", "\38\84\215\41\118\220\70"));
local PlayerGui = localPlayer:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\26\35\11\251\66\49\55\27", "\158\48\118\66\114"));
Config = {[LUAOBFUSACTOR_DECRYPT_STR_0("\155\40\17\47\118\183", "\155\203\68\112\86\19\197")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\111\211\48\214\85\117\245", "\152\38\189\86\156\32\24\133")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\203\86\171\77\207\71\162\67\248", "\38\156\55\199")]=false}};
_G.collect = false;
getgenv().autowistle = false;
getgenv().annoydowned = false;
getgenv().Settings = {[LUAOBFUSACTOR_DECRYPT_STR_0("\165\114\114\45\10\114\251\81\165", "\35\200\29\28\72\115\20\154")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\24\185\218\217\140\62\57", "\84\121\223\177\191\237\76")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\149\89\234\161\55\85\34\192\136\94\200\171\63", "\161\219\54\169\192\90\48\80")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\109\77\23\43\76\70\16\41\72\91\5\55\76\81\16", "\69\41\34\96")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\157\214\195\5\48\46\175\211\214\29\12", "\75\220\163\183\106\98")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\49\170\142\50\221", "\185\98\218\235\87")]=1450,[LUAOBFUSACTOR_DECRYPT_STR_0("\225\41\42\246", "\202\171\92\71\134\190")]=3,[LUAOBFUSACTOR_DECRYPT_STR_0("\59\196\58\129\63\196\24\129\36\196", "\232\73\161\76")]=3,[LUAOBFUSACTOR_DECRYPT_STR_0("\159\214\85\83\27\191\250\77\81\17\169", "\126\219\185\34\61")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\60\194\95\107\123\101\208\232\0\193\76", "\135\108\174\62\18\30\23\147")]=Color3.fromRGB(255, 170, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\165\253\43\223\11", "\167\214\137\74\171\120\206\83")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\191\249\49\86\253\179\173\241\32\80", "\199\235\144\82\61\152")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\2\23\171\37\2\18", "\75\103\118\217")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\195\65\98\21\173\23\200\90", "\126\167\52\16\116\217")]=0},[LUAOBFUSACTOR_DECRYPT_STR_0("\252\33\43\133\186\63\253\218\35", "\156\168\78\64\224\212\121")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\2\239\183\192\2\234", "\174\103\142\197")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\82\61\77\57\49\87\247\88", "\152\54\72\63\88\69\62")]=0}}};
local function isPlayerOnMobile()
	return UserInputService.TouchEnabled and not (UserInputService.KeyboardEnabled or UserInputService.GamepadEnabled);
end
local RayfieldURL = (isPlayerOnMobile() and "https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library") or "https://sirius.menu/rayfield";
local Rayfield = loadstring(game:HttpGet(RayfieldURL))();
local notifs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))();
local changelog = game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/misc/clogevade.lua");
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/SimpleHighlightESP.lua"))();
if rconsoleprint then
	rconsoleprint(changelog);
end
local Window = Rayfield:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\250\197\227\89", "\60\180\164\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\96\91\11\38\41\173\58\109\124", "\114\56\62\101\73\71\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\230\218\192\177\231\220\240\177\253\215\193", "\164\216\137\187")]=LUAOBFUSACTOR_DECRYPT_STR_0("\234\227\63\189\168", "\107\178\134\81\210\198\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\20\1\131\194\163\54\9\177\211\168\44\7\150\202\175", "\202\88\110\226\166")]=LUAOBFUSACTOR_DECRYPT_STR_0("\193\22\194\207\207\205\0\140", "\170\163\111\226\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\63\188\62\71\48\60\3\49\166\49\65\57\26\16\38\187\54\73", "\73\113\80\210\88\46\87")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\164\34\204\16\235\132\40", "\135\225\76\173\114")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\60\226\180\180\169\175\137\27\224\189", "\199\122\141\216\208\204\221")]=LUAOBFUSACTOR_DECRYPT_STR_0("\149\216\30\255\118", "\150\205\189\112\144\24"),[LUAOBFUSACTOR_DECRYPT_STR_0("\3\141\179\73\42\137\28\21", "\112\69\228\223\44\100\232\113")]=LUAOBFUSACTOR_DECRYPT_STR_0("\236\26\9\220\184", "\230\180\127\103\179\214\28")},[LUAOBFUSACTOR_DECRYPT_STR_0("\168\12\76\69\235\83\228", "\128\236\101\63\38\132\33")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\137\167\16\70\186\238\203", "\175\204\201\113\36\214\139")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\110\194\35\213\16\66", "\100\39\172\85\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\165\86\129\216\5\181\123\179\173\21", "\83\205\24\217\224"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\192\192\56\235\199\200\47\204\202\196\51\245", "\93\134\165\173")]=true},[LUAOBFUSACTOR_DECRYPT_STR_0("\149\247\216\241\35\221\166\123\179", "\30\222\146\161\162\90\174\210")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\206\75\105\57\224\90\100\3\235\73\99", "\106\133\46\16")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\108\41\103\240\95", "\32\56\64\19\156\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\98\205\235\89\84", "\224\58\168\133\54\58\146"),[LUAOBFUSACTOR_DECRYPT_STR_0("\106\67\73\233\124\146\139\14", "\107\57\54\43\157\21\230\231")]=LUAOBFUSACTOR_DECRYPT_STR_0("\240\142\8\181\138\197\220\207\142\28", "\175\187\235\113\149\217\188"),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\160\149\73", "\24\92\207\225\44\131\25")]="Join the discord (discord.gg/hNX8VxcjMF)",[LUAOBFUSACTOR_DECRYPT_STR_0("\109\218\180\73\53\124\70\214", "\29\43\179\216\44\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\133\220\46\67\179", "\44\221\185\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\230\94\90\88\4\254", "\19\97\135\40\63")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\137\78\50\57\4\52\183\122\33\52\34\2\167\72\54", "\81\206\60\83\91\79")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\101\174\201", "\196\46\203\176\18\79\163\45")]=LUAOBFUSACTOR_DECRYPT_STR_0("\144\39\114\18\43", "\143\216\66\30\126\68\155")}});
game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\152\205\29\199\204\160\214\245\175\204\62\223\202\177\214\230\175", "\129\202\168\109\171\165\195\183")).Events.Respawn:FireServer();
repeat
	task.wait();
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name) 
repeat
	task.wait();
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\10\77\58\217\208\27\239\38\106\56\215\202\36\231\48\76", "\134\66\56\87\184\190\116")) 
local eventTaunts = {LUAOBFUSACTOR_DECRYPT_STR_0("\31\36\27\168\28\239\7\57\61\34\1\183\16\236\41\33", "\85\92\81\105\219\121\139\65"),LUAOBFUSACTOR_DECRYPT_STR_0("\202\182\66\64\107\208\241\181\120\74\107\211", "\191\157\211\48\37\28"),LUAOBFUSACTOR_DECRYPT_STR_0("\235\16\249\30\41\203\16\250\25", "\90\191\127\148\124"),LUAOBFUSACTOR_DECRYPT_STR_0("\90\134\41\31\125\134\42", "\119\24\231\78"),LUAOBFUSACTOR_DECRYPT_STR_0("\166\40\168\69\210\104\30\144\35\182", "\113\226\77\197\42\188\32"),LUAOBFUSACTOR_DECRYPT_STR_0("\25\23\250\177\54\19\252\176\59\18", "\213\90\118\148"),LUAOBFUSACTOR_DECRYPT_STR_0("\114\35\164\87\65\94\42\156\83\76\95", "\45\59\78\212\54"),LUAOBFUSACTOR_DECRYPT_STR_0("\39\95\151\136\142\6\172\228", "\144\112\54\227\235\230\78\205"),LUAOBFUSACTOR_DECRYPT_STR_0("\151\61\14\240\242\84\189\45\60\235\223\73\183\59", "\59\211\72\111\156\176"),LUAOBFUSACTOR_DECRYPT_STR_0("\98\134\245\44\98\134\238\61", "\77\46\231\131"),LUAOBFUSACTOR_DECRYPT_STR_0("\137\68\191\68\191\70\159\78\188\81\165\84\187\64\191\79\180", "\32\218\52\214"),LUAOBFUSACTOR_DECRYPT_STR_0("\126\2\60\184\216\164\112\74", "\58\46\119\81\200\145\208\37"),LUAOBFUSACTOR_DECRYPT_STR_0("\29\141\61\188\160\175\51\4\153\36\170\160\169", "\86\75\236\80\204\201\221"),LUAOBFUSACTOR_DECRYPT_STR_0("\93\76\126\139\241\158\97\101\114\136\247\152\119", "\235\18\33\23\229\158"),LUAOBFUSACTOR_DECRYPT_STR_0("\114\182\212\190\120\187\205\183\95\173\196\191\118\187\194\190", "\219\48\218\161"),LUAOBFUSACTOR_DECRYPT_STR_0("\195\99\121\76\213\103\225\232\125\115\94\222\75\198\229\114\121", "\128\132\17\28\41\187\47"),LUAOBFUSACTOR_DECRYPT_STR_0("\46\32\7\52\90\4\26\7\54\81\14\37\3\62\123\0\49\3", "\61\97\82\102\90"),LUAOBFUSACTOR_DECRYPT_STR_0("\139\38\164\88\211\116\31\29\175\38\174\89", "\105\204\78\203\43\167\55\126"),LUAOBFUSACTOR_DECRYPT_STR_0("\129\175\46\17\29\51\206\95\162\185", "\49\197\202\67\126\115\100\167"),LUAOBFUSACTOR_DECRYPT_STR_0("\20\90\209\45\140\83\114\54\86\207", "\62\87\59\191\73\224\54"),LUAOBFUSACTOR_DECRYPT_STR_0("\193\23\244\206\230\14\213\223\226\16\253\219\232\21\238\193", "\169\135\98\154"),LUAOBFUSACTOR_DECRYPT_STR_0("\249\114\37\90\244\62\201\223\114\32", "\168\171\23\68\52\157\83"),LUAOBFUSACTOR_DECRYPT_STR_0("\192\126\237\164\38\4\137\242\116\231\163\42", "\231\148\17\149\205\69\77"),LUAOBFUSACTOR_DECRYPT_STR_0("\173\168\201\244\84\234\140\174", "\159\224\199\167\155\55"),LUAOBFUSACTOR_DECRYPT_STR_0("\192\225\57\198\244\251\57\214\192\250\50\213\228", "\178\151\147\92"),LUAOBFUSACTOR_DECRYPT_STR_0("\188\245\77\60\6\67\119\174\241\77\54\23\95", "\26\236\157\44\82\114\44"),LUAOBFUSACTOR_DECRYPT_STR_0("\11\35\208\79\34\55\198\79\25\58\212\93\44", "\59\74\78\181"),LUAOBFUSACTOR_DECRYPT_STR_0("\2\217\85\73\167\4\211\94\79\176\49\216\85\84", "\211\69\177\58\58"),LUAOBFUSACTOR_DECRYPT_STR_0("\131\224\117\240\250\219\178\233\117", "\171\215\133\25\149\137"),LUAOBFUSACTOR_DECRYPT_STR_0("\213\192\32\243\227\60\249\80", "\34\129\168\82\154\143\80\156"),LUAOBFUSACTOR_DECRYPT_STR_0("\167\190\38\14\78\71\155\128\130\60\25\92\79\133", "\233\229\210\83\107\40\46"),LUAOBFUSACTOR_DECRYPT_STR_0("\233\71\62\218\3\200\80\55\230\10\211\86\51\218", "\101\161\34\82\182"),LUAOBFUSACTOR_DECRYPT_STR_0("\219\8\92\245\210\236\133\11\241\8", "\78\136\109\57\158\187\130\226"),LUAOBFUSACTOR_DECRYPT_STR_0("\27\38\252\210\49\45\235\228\46\43\240\254\48", "\145\94\95\153"),LUAOBFUSACTOR_DECRYPT_STR_0("\211\200\23\199\65\186\242\195\29\214\65\185", "\215\157\173\116\181\46"),LUAOBFUSACTOR_DECRYPT_STR_0("\19\166\130\245\210\33\146\158\252\209", "\186\85\212\235\146"),LUAOBFUSACTOR_DECRYPT_STR_0("\224\141\3\251\12\200\119\227\131\18\235\58\250\81\205\143", "\56\162\225\118\158\89\142"),LUAOBFUSACTOR_DECRYPT_STR_0("\108\12\206\164\23\254\115\36\194\171\55\219\72\12\207\161", "\184\60\101\160\207\66"),LUAOBFUSACTOR_DECRYPT_STR_0("\18\131\105\176\53\144\115\178\57\135\125\184", "\220\81\226\28"),LUAOBFUSACTOR_DECRYPT_STR_0("\59\208\142\247\227\212\27\242\144\242\250", "\167\115\181\226\155\138"),LUAOBFUSACTOR_DECRYPT_STR_0("\202\35\242\82\111\116\194\203\48\226\88\126\98\197\231\44\228\89", "\166\130\66\135\60\27\17"),LUAOBFUSACTOR_DECRYPT_STR_0("\103\69\204\98\53\70\126\220\116\32", "\80\36\42\174\21"),LUAOBFUSACTOR_DECRYPT_STR_0("\99\21\52\114\79\30\62\121\79\28\4\121\87\4\63\127", "\26\46\112\87"),LUAOBFUSACTOR_DECRYPT_STR_0("\157\49\170\115\176\177\118\191\172\47\167", "\212\217\67\203\20\223\223\37"),LUAOBFUSACTOR_DECRYPT_STR_0("\157\133\167\193\174\171\186\219\191\131\172", "\178\218\237\200"),LUAOBFUSACTOR_DECRYPT_STR_0("\133\165\239\220\186\176\226\243\183\160\234\212\164\186\232", "\176\214\213\134"),LUAOBFUSACTOR_DECRYPT_STR_0("\195\172\164\208\161\88\94\216\172\184\192\173\68\87", "\57\148\205\214\180\200\54"),LUAOBFUSACTOR_DECRYPT_STR_0("\32\242\54\63\127\28\206\33\38\127\22\248", "\22\114\157\85\84"),"Rockin'Stride",LUAOBFUSACTOR_DECRYPT_STR_0("\224\202\1\207\105\243\166\192\217\26\200\78", "\200\164\171\115\164\61\150"),LUAOBFUSACTOR_DECRYPT_STR_0("\159\248\0\77\134\179\253\16\81\161\187\248\23", "\227\222\148\99\37"),LUAOBFUSACTOR_DECRYPT_STR_0("\21\64\83\248\242\54\92\65\226\252\58\92", "\153\83\50\50\150"),LUAOBFUSACTOR_DECRYPT_STR_0("\120\122\118\31\103\185\68\91\111\122\18\116\140\88\84\98\114\14", "\45\61\22\19\124\19\203"),LUAOBFUSACTOR_DECRYPT_STR_0("\227\19\25\195\11\99\176\206\28", "\217\161\114\109\149\98\16"),LUAOBFUSACTOR_DECRYPT_STR_0("\48\33\54\125\178\117\33\53\49\104", "\20\114\64\88\28\220"),LUAOBFUSACTOR_DECRYPT_STR_0("\20\24\215\157\244\220\168\34\8\221\186\235", "\221\81\97\178\212\152\176"),LUAOBFUSACTOR_DECRYPT_STR_0("\239\245\18\244\23\226\225\57\244\21\192", "\122\173\135\125\155"),LUAOBFUSACTOR_DECRYPT_STR_0("\166\205\15\182\59\28\199\139\207", "\168\228\161\96\217\95\81")};
function autowistlefunction()
	while autowistle == true do
		local ohString1 = LUAOBFUSACTOR_DECRYPT_STR_0("\236\217\39\79\59\91\222", "\55\187\177\78\60\79");
		local ohBoolean2 = true;
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\29\194\94\242\67\221\147", "\224\77\174\63\139\38\175")).LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2);
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\182\68\72\34\141\66\89\58\129\69\107\58\139\83\89\41\129", "\78\228\33\56")).Events.Whistle:FireServer();
		wait(5);
	end
end
task.spawn(function()
	while task.wait() do
		if Settings.AutoRespawn then
			if (localplayer.Character and localplayer.Character:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\234\113\165\13\128\202", "\229\174\30\210\99"))) then
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\41\232\150\93\228\62\56\15\232\130\98\249\50\43\26\234\131", "\89\123\141\230\49\141\93")).Events.Respawn:FireServer();
			end
		end
		if Settings.NoCameraShake then
			localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0, 0, 0) * CFrame.new(0, 0, 0);
		end
		if Settings.moneyfarm then
			TypeLabelC5:Set(LUAOBFUSACTOR_DECRYPT_STR_0("\222\126\248\9\9\10\213\112\228\1", "\42\147\17\150\108\112"));
			DurationLabelC5:Set(LUAOBFUSACTOR_DECRYPT_STR_0("\43\179\63\126\243\225\0\168\119", "\136\111\198\77\31\135") .. convertToHMS(Settings.stats.TokenFarm.duration));
			EarnedLabelC5:Set(LUAOBFUSACTOR_DECRYPT_STR_0("\39\8\181\88\184\224\77", "\201\98\105\199\54\221\132\119") .. formatNumber(Settings.stats.TokenFarm.earned));
			if (localplayer:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\144\2\174\36\12\32", "\204\217\108\227\65\98\85")) and (localplayer:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\122\198\244\225", "\160\62\163\149\133\76")) ~= true)) then
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\228\165\29\35\202\213\161\25\42\199\229\180\2\61\194\209\165", "\163\182\192\109\79")).Events.Respawn:FireServer();
			end
			if (localplayer.Character and localplayer.Character:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\16\41\23\206\240\48", "\149\84\70\96\160"))) then
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\10\3\29\225\49\5\12\249\61\2\62\249\55\20\12\234\61", "\141\88\102\109")).Events.Respawn:FireServer();
				task.wait(3);
			else
				revive();
				task.wait(1);
			end
		end
		if ((Settings.moneyfarm == false) and Settings.afkfarm and (localplayer.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\155\70\199\113\20\50\92\197\129\92\197\100\42\60\71\213", "\161\211\51\170\16\122\93\53")) ~= nil)) then
			localplayer.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\211\187\191\41\245\161\187\44\201\161\189\60\203\175\160\60", "\72\155\206\210")).CFrame = CFrame.new(6007, 7005, 8005);
		end
	end
end);
function bb()
	while getgenv().breakbots do
		n = math.random(1, 10000000);
		z = math.random(200, 8000);
		x = math.random(1, 10000000);
		if not getgenv().breakbots then
			break;
		end
		if game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\113\117\70\5\32\86\123\87\11", "\83\38\26\52\110")).Game:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\117\22\55", "\38\56\119\71")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\195\238\74\194\54", "\54\147\143\56\182\69")):FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\253\136\243\69\253\196\136\252\66\204", "\191\182\225\159\41")) then
			game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\28\29\58\94\152\151\195\40\23", "\162\75\114\72\53\235\231")).Game:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\161\61\84", "\98\236\92\36\130\51")).KillBricks:Destroy();
		end
		task.wait();
		game.Workspace.Game.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\140\12\1\187\75\167\188\52\150\22\3\174\117\169\167\36", "\80\196\121\108\218\37\200\213")).CFrame = CFrame.new(0, z, 0);
	end
end
function annoydown()
	if annoydowned then
		makeNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\23\114\16\113\66\0\141", "\234\96\19\98\31\43\110"), LUAOBFUSACTOR_DECRYPT_STR_0("\62\26\92\200\162\50\163\51\61\18\219\236\107\156\21\26\64\198\191\118\141\7\12\9\193\160\97", "\235\102\127\50\167\204\18"), LUAOBFUSACTOR_DECRYPT_STR_0("\68\169\252\48\4\57\89\173\249\99\73\33\67\181\181\47\77\37\85\173\236\99\70\60\85\160\254\99\83\39\68\169\250\54\80\110\113\180\225\44\4\28\85\178\229\34\83\32", "\78\48\193\149\67\36"));
	end
	local carriedPlayers = {};
	local isTeleporting = false;
	while task.wait() do
		if not getgenv().annoydowned then
			break;
		end
		pcall(function()
			game.Players.LocalPlayer.Character:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\24\11\141\25\79\63\23\132\42\78\63\10\176\25\83\36", "\33\80\126\224\120"));
			for i, v in next, game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\219\167\17\207\79\252\169\0\193", "\60\140\200\99\164")).Game.Players:GetDescendants() do
				if (v.IsA(v, LUAOBFUSACTOR_DECRYPT_STR_0("\169\225\9\36\167\149\194\5\42\183\130", "\194\231\148\100\70")) and (v.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\98\67\214\173\243\204", "\168\38\44\161\195\150")) and not v.Parent.Parent.Parent:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\163\253\144\100\57\237\178\52\153", "\118\224\156\226\22\80\136\214")) and (game.Players[v.Parent.Parent.Parent.Name].Settings.CanBeCarried.Value == true) and not carriedPlayers[v.Parent.Parent.Parent.Name] and not isTeleporting) then
					local holder = v.Parent.Parent.Parent.Name;
					local hold = workspace.Game.Players[holder];
					isTeleporting = true;
					task.spawn(function()
						scrip = require(game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\112\235\73\140\75\237\88\148\71\234\106\148\77\252\88\135\71", "\224\34\142\57")).ModuleStorage.Interact.Interactions.Revive.Revive);
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(hold.HumanoidRootPart.Position);
						task.wait(0.3);
						game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\236\162\213\209\122\242\92\26\219\163\246\201\124\227\92\9\219", "\110\190\199\165\189\19\145\61")).Events.Revive.CarryPlayer:FireServer(holder);
						task.wait(0.3);
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new;
						task.wait(0.2);
						game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\232\238\103\228\130\196\219\255\114\236\184\211\213\249\118\239\142", "\167\186\139\23\136\235")).Events.Revive.CarryPlayer:FireServer(holder, true);
						task.wait(0.5);
						carriedPlayers[holder] = true;
						isTeleporting = false;
					end);
				end
			end
		end);
	end
end
function makeNotification(type, head, body)
	notifs.new(type, head, body, true, 5);
end
function Simple_Create(base, name, trackername, studs)
	local bb = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\56\188\132\1\24\186\137\31\30\146\157\4", "\109\122\213\232"), game.CoreGui);
	bb.Adornee = base;
	bb.ExtentsOffset = Vector3.new(0, 1, 0);
	bb.AlwaysOnTop = true;
	bb.Size = UDim2.new(0, 6, 0, 6);
	bb.StudsOffset = Vector3.new(0, 1, 0);
	bb.Name = trackername;
	local frame = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\200\229\163\61\235", "\80\142\151\194"), bb);
	frame.ZIndex = 10;
	frame.BackgroundTransparency = 0.3;
	frame.Size = UDim2.new(1, 0, 1, 0);
	frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
	local txtlbl = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\55\195\111\88\47\199\117\73\15", "\44\99\166\23"), bb);
	txtlbl.ZIndex = 10;
	txtlbl.BackgroundTransparency = 1;
	txtlbl.Position = UDim2.new(0, 0, 0, -48);
	txtlbl.Size = UDim2.new(1, 0, 10, 0);
	txtlbl.Font = LUAOBFUSACTOR_DECRYPT_STR_0("\93\229\32\55\63\134\115\251\45", "\196\28\151\73\86\83");
	txtlbl.FontSize = LUAOBFUSACTOR_DECRYPT_STR_0("\192\10\51\21\211\10", "\22\147\99\73\112\226\56\120");
	txtlbl.Text = name;
	txtlbl.TextStrokeTransparency = 0.5;
	txtlbl.TextColor3 = Color3.fromRGB(255, 0, 0);
end
function ClearESP(espname)
	for _, v in pairs(game.CoreGui:GetChildren()) do
		if ((v.Name == espname) and v:isA(LUAOBFUSACTOR_DECRYPT_STR_0("\154\124\238\249\143\183\116\240\241\170\173\124", "\237\216\21\130\149"))) then
			v:Destroy();
		end
	end
end
function nowaterdmg(t)
	for i, v in next, t:GetChildren() do
		if v.IsA(v, LUAOBFUSACTOR_DECRYPT_STR_0("\160\79\76\90\128\200\76\150", "\62\226\46\63\63\208\169")) then
			v.CanTouch = false;
		end
	end
end
game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\208\10\80\145\54\3\63\75\241\42\80\145\9\4\44\91", "\62\133\121\53\227\127\109\79")).JumpRequest:connect(function()
	if Config.Player.InfJump then
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\32\24\51\236\211\188\177", "\194\112\116\82\149\182\206")).LocalPlayer.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\17\189\65\25\206\237\7\61", "\110\89\200\44\120\160\130")):ChangeState(LUAOBFUSACTOR_DECRYPT_STR_0("\129\214\70\86\74\68\60", "\45\203\163\43\38\35\42\91"));
	end
end);
local old;
old = hookmetamethod(game, LUAOBFUSACTOR_DECRYPT_STR_0("\237\186\210\34\138\172\87\211\137\208", "\52\178\229\188\67\231\201"), newcclosure(function(self, ...)
	local Args = {...};
	local method = getnamecallmethod();
	if ((tostring(self) == LUAOBFUSACTOR_DECRYPT_STR_0("\2\78\93\9\226\82\42\34\64\68\11\229", "\67\65\33\48\100\151\60")) and (method == LUAOBFUSACTOR_DECRYPT_STR_0("\246\233\184\215\248\218\212\171\202\229\218\245", "\147\191\135\206\184")) and (Args[1] == LUAOBFUSACTOR_DECRYPT_STR_0("\145\56\162\192\204\86", "\210\228\72\198\161\184\51"))) then
		return Settings.Speed, Settings.Jump;
	end
	return old(self, ...);
end));
local revive = function()
	local downedplr = GetDownedPlr();
	if ((downedplr ~= nil) and downedplr:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\30\92\254\17\125\193\63\77\193\31\124\218\6\72\225\4", "\174\86\41\147\112\19"))) then
		task.spawn(function()
			while task.wait() do
				if localplayer.Character then
					workspace.Game.Settings:SetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\105\5\155\2\51\10\37\162\86\5", "\203\59\96\237\107\69\111\113"), 2.2);
					localplayer.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\12\3\161\224\63\255\222\32\36\163\238\37\192\214\54\2", "\183\68\118\204\129\81\144")).CFrame = CFrame.new(downedplr:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\38\184\125\229\5\141\7\169\66\235\4\150\62\172\98\240", "\226\110\205\16\132\107")).Position.X, downedplr:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\195\214\237\216\79\228\202\228\235\78\228\215\208\216\83\255", "\33\139\163\128\185")).Position.Y + 3, downedplr:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\127\77\9\223\89\87\13\218\101\87\11\202\103\89\22\202", "\190\55\56\100")).Position.Z);
					task.wait();
					game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\100\170\44\18\26\224\242\66\170\56\45\7\236\225\87\168\57", "\147\54\207\92\126\115\131")).Events.Revive.RevivePlayer:FireServer(tostring(downedplr), false);
					task.wait(4.5);
					game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\63\52\37\113\4\125\12\37\48\121\62\106\2\35\52\122\8", "\30\109\81\85\29\109")).Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true);
					game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\205\116\68\186\63\221\253\235\116\80\133\34\209\238\254\118\81", "\156\159\17\52\214\86\190")).Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true);
					game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\156\234\173\176\167\236\188\168\171\235\142\168\161\253\188\187\171", "\220\206\143\221")).Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true);
					break;
				end
			end
		end);
	end
end;
task.spawn(function()
	while task.wait() do
		if Settings.TicketFarm then
			TypeLabelC5:Set(LUAOBFUSACTOR_DECRYPT_STR_0("\178\116\46\28\221\216\146\160\124\63\26", "\178\230\29\77\119\184\172"));
			DurationLabelC5:Set(LUAOBFUSACTOR_DECRYPT_STR_0("\209\171\24\26\99\241\250\176\80", "\152\149\222\106\123\23") .. convertToHMS(Settings.stats.TicketFarm.duration));
			EarnedLabelC5:Set(LUAOBFUSACTOR_DECRYPT_STR_0("\248\39\228\77\176\217\124", "\213\189\70\150\35") .. formatNumber(Settings.stats.TicketFarm.earned));
			if ((game.Players.LocalPlayer:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\102\91\89\13\65\64", "\104\47\53\20")) ~= true) and (localplayer:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\135\73\128\24", "\111\195\44\225\124\220")) ~= true)) then
				for i, v in pairs(game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\239\73\18\120\184\187\217\69\5", "\203\184\38\96\19\203")).Game.Effects.Tickets:GetChildren()) do
					localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\17\102\116\64\192\54\122\125\115\193\54\103\73\64\220\45", "\174\89\19\25\33")).Position);
				end
			else
				task.wait(2);
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\29\23\66\66\254\132\10\59\23\86\125\227\136\25\46\21\87", "\107\79\114\50\46\151\231")).Events.Respawn:FireServer();
			end
			if (localplayer.Character and localplayer.Character:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\29\169\162\39\143\61", "\160\89\198\213\73\234\89\215"))) then
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\122\116\164\242\204\75\112\160\251\193\123\101\187\236\196\79\116", "\165\40\17\212\158")).Events.Respawn:FireServer();
				task.wait(2);
			end
		end
	end
end);
local Tab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\200\216\1\61", "\70\133\185\104\83"), 4483362458);
local Section = Tab:CreateSection(LUAOBFUSACTOR_DECRYPT_STR_0("\41\68\77\36", "\169\100\37\36\74"));
local Slider = Tab:CreateSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\46\134\175\85", "\48\96\231\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\255\91\2\38\89\235\191\134\205\94", "\227\168\58\110\77\121\184\207"),[LUAOBFUSACTOR_DECRYPT_STR_0("\73\61\177\71\180", "\197\27\92\223\32\209\187\17")]={1450,10000},[LUAOBFUSACTOR_DECRYPT_STR_0("\42\81\192\233\6\82\198\245\23", "\155\99\63\163")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\177\196\167\139\176\156", "\228\226\177\193\237\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\3\177\47\237\7\160\38\227\48", "\134\84\208\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\48\185\148\78\22\162\146\106\18\160\147\89", "\60\115\204\230")]=1450,[LUAOBFUSACTOR_DECRYPT_STR_0("\193\54\234\119", "\16\135\90\139")]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\120\15\55\75\70\41", "\24\52\20\102\83\46\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\231\46\45\40\13\197\44\42", "\111\164\79\65\68")]=function(Value)
	Settings.Speed = Value;
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\232\216\142\219", "\138\166\185\227\190\78")]=LUAOBFUSACTOR_DECRYPT_STR_0("\234\127\209\62\84\99\63\196\102\133\3\66\99\82\139\85\208\35\93\99\58\202\102\215\46", "\121\171\20\165\87\50\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\45\171\36\188\12\210\14\184\58\172\7", "\98\166\88\217\86\217")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\208\250\120\6", "\188\150\150\25\97\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\238\134\88\5\0\232\131", "\141\186\233\63\98\108"),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\235\32\186\39\240\233\39", "\69\145\138\76\214")]=function(down)
	getgenv().annoydowned = down;
	annoydown();
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\94\206\132\140", "\118\16\175\233\233\223")]=LUAOBFUSACTOR_DECRYPT_STR_0("\169\145\33\175\225\133\61\191\148\117\240\174\170\104\159\139\117\152\239\153\111\146", "\29\235\228\85\219\142\235"),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\193\168\207\114\64\51\100\60\216\175\216", "\50\93\180\218\189\23\46\71")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\253\165\87\64\70\221\75\213", "\40\190\196\59\44\36\188")]=function()
	local gui, frame, button = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\15\70\206\177\255\115\42\41\76", "\109\92\37\188\212\154\29"), game.CoreGui), Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\34\253\165\206\52", "\58\100\143\196\163\81")), Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\46\71\59\183\29\92\241\26\21\76", "\110\122\34\67\195\95\41\133"));
	gui.ResetOnSpawn = false;
	frame.Size, frame.Position, frame.BackgroundColor3, frame.BorderSizePixel, frame.Active, frame.Draggable, frame.Parent = UDim2.new(0, 150, 0, 75), UDim2.new(0, 10, 0, 10), Color3.new(0, 0, 0), 0, true, true, gui;
	button.Text, button.Size, button.Position, button.BackgroundColor3, button.BorderColor3, button.BorderSizePixel, button.Font, button.TextColor3, button.TextSize, button.Parent = LUAOBFUSACTOR_DECRYPT_STR_0("\65\161\27\1\150\84\164\79\69\150\86\176\73\88\207", "\182\21\209\59\42"), UDim2.new(1, -20, 1, -20), UDim2.new(0, 10, 0, 10), Color3.new(0, 0, 0), Color3.new(), 2, Enum.Font.SourceSans, Color3.new(1, 1, 1), 16, frame;
	button.MouseButton1Click:Connect(function(down)
		annoydown();
	end);
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\153\86\200\24", "\222\215\55\165\125\65")]=LUAOBFUSACTOR_DECRYPT_STR_0("\13\196\210\21\178\246\228\89\56\221\195", "\42\76\177\166\122\146\161\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\134\159\23\220\124\120\177\188\4\194\108\115", "\22\197\234\101\174\25")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\11\56\164\219", "\230\77\84\197\188\22\207\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\27\193\251\128\164\168", "\85\153\116\166\156\236\193\144"),[LUAOBFUSACTOR_DECRYPT_STR_0("\135\225\65\191\230\1\167\235", "\96\196\128\45\211\132")]=function(Value)
	getgenv().autowistle = Value;
	autowistlefunction();
end});
local Button = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\27\140\118\90", "\184\85\237\27\63\178\207\212")]=LUAOBFUSACTOR_DECRYPT_STR_0("\33\87\15\31\34\76\4\79", "\63\104\57\105"),[LUAOBFUSACTOR_DECRYPT_STR_0("\40\134\168\72\9\134\167\79", "\36\107\231\196")]=function(state)
	Config.Player.InfJump = state;
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\115\180\175\130", "\231\61\213\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\172\48\118\27\172\125\93\6\237\14\123\8\166\56", "\19\105\205\93"),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\29\204\147\58\167\28\232\128\51\188\13", "\95\201\104\190\225")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\137\199\192\201", "\174\207\171\161")]=LUAOBFUSACTOR_DECRYPT_STR_0("\217\241\10\244\244\210\187", "\183\141\158\109\147\152"),[LUAOBFUSACTOR_DECRYPT_STR_0("\15\8\234\0\46\8\229\7", "\108\76\105\134")]=function(State)
	Settings.NoCameraShake = State;
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\197\196\188\228", "\174\139\165\209\129")]=LUAOBFUSACTOR_DECRYPT_STR_0("\130\166\246\206\134\49\117\107\179\178\245\207", "\24\195\211\130\161\166\99\16"),[LUAOBFUSACTOR_DECRYPT_STR_0("\101\22\251\62\86\24\82\53\232\32\70\19", "\118\38\99\137\76\51")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\219\42\4\21", "\64\157\70\101\114\105")]=LUAOBFUSACTOR_DECRYPT_STR_0("\116\167\160\228\28\69\249", "\112\32\200\199\131"),[LUAOBFUSACTOR_DECRYPT_STR_0("\15\81\80\180\193\170\33\39", "\66\76\48\60\216\163\203")]=function(x)
	getgenv().respawning = x;
	while task.wait(1) and respawning do
		if not getgenv().respawning then
			break;
		end
		local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();
		local stats = char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\137\146\120\231\124\198\37\180\129\124\224", "\68\218\230\25\147\63\174"), 3);
		if (stats == nil) then
			return;
		end
		if (stats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\158\58\86\73\178", "\214\205\74\51\44")) and stats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\92\231\249\115", "\23\154\44\130\156")):FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\53\169\186\160\51\23", "\115\113\198\205\206\86"))) then
			game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\182\82\238\86\141\84\255\78\129\83\205\78\139\69\255\93\129", "\58\228\55\158")).Events.Respawn:FireServer();
		end
	end
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\154\136\221\43", "\85\212\233\176\78\92\205")]=LUAOBFUSACTOR_DECRYPT_STR_0("\108\89\155\246\10\106\141\244\67\78\141", "\130\42\56\232"),[LUAOBFUSACTOR_DECRYPT_STR_0("\201\160\54\241\69\49\254\131\37\239\85\58", "\95\138\213\68\131\32")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\12\36\160\68", "\22\74\72\193\35")]=LUAOBFUSACTOR_DECRYPT_STR_0("\24\118\227\95\32\124\182", "\56\76\25\132"),[LUAOBFUSACTOR_DECRYPT_STR_0("\125\192\167\42\205\95\194\160", "\175\62\161\203\70")]=function(State)
	if State then
		workspace.Game.Settings:SetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\14\216\213\26\35\57\233\202\30\48", "\85\92\189\163\115"), 2.2);
	else
		workspace.Game.Settings:SetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\27\169\38\49\63\169\4\49\36\169", "\88\73\204\80"), Settings.reviveTime);
	end
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\0\130\29\67", "\186\78\227\112\38\73")]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\82\240\90\69\127\188\117\252\71\65\115\249\69\238", "\26\156\55\157\53\51"),[LUAOBFUSACTOR_DECRYPT_STR_0("\175\217\26\213\186\81\143\211", "\48\236\184\118\185\216")]=function()
	workspace.Game.Map.InvisParts:ClearAllChildren();
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\188\90\53", "\84\133\221\55\80\175")]=LUAOBFUSACTOR_DECRYPT_STR_0("\158\239\37\178\135\111\173\254", "\60\221\135\68\198\167"),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\188\244\143\64\216\237\182", "\185\142\221\152\227\34")]=function()
	enabled = true;
	spyOnMyself = false;
	public = false;
	publicItalics = true;
	privateProperties = {[LUAOBFUSACTOR_DECRYPT_STR_0("\123\202\91\245\81", "\151\56\165\55\154\35\83")]=Color3.fromRGB(0, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\134\76\11\250", "\142\192\35\101")]=Enum.Font.SourceSansBold,[LUAOBFUSACTOR_DECRYPT_STR_0("\226\112\49\183\212\133\182\19", "\118\182\21\73\195\135\236\204")]=18};
	local StarterGui = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\59\40\27\82\16\8\239\47\41\19", "\157\104\92\122\32\100\109"));
	local Players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\147\170\206\211\56\53\158", "\203\195\198\175\170\93\71\237"));
	local player = Players.LocalPlayer;
	local saymsg = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\28\78\46\217\88\18\253\58\78\58\230\69\30\238\47\76\59", "\156\78\43\94\181\49\113")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\86\237\194\162\30\79\109\81\224\197\183\56\90\106\102\237\201\128\3\66\109\87\254\193\173\31\80", "\25\18\136\164\195\107\35")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\219\44\176\98\119\175\210\185\239\40\155\74\99\169\196\171\252", "\216\136\77\201\47\18\220\161"));
	local getmsg = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\31\233\59\214\1\223\131\57\233\47\233\28\211\144\44\235\46", "\226\77\140\75\186\104\188")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\157\203\214\62\90\181\218\243\55\78\173\253\201\44\91\188\195\243\55\78\173\235\198\58\65\173\221", "\47\217\174\176\95")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\151\211\91\7\161\71\121\33\189\249\121\12\183\114\113\42\172\216\100\11\188\83", "\70\216\189\22\98\210\52\24"));
	local instance = (_G.chatSpyInstance or 0) + 1;
	_G.chatSpyInstance = instance;
	local function onChatted(p, msg)
		if (_G.chatSpyInstance == instance) then
			if ((p == player) and (msg:lower():sub(1, 4) == "/spy")) then
				enabled = not enabled;
				wait(0.3);
				privateProperties.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\193\236\147\190\147", "\179\186\191\195\231") .. ((enabled and LUAOBFUSACTOR_DECRYPT_STR_0("\220\17", "\132\153\95\120")) or LUAOBFUSACTOR_DECRYPT_STR_0("\149\155\61", "\192\209\210\110\77\151\186")) .. LUAOBFUSACTOR_DECRYPT_STR_0("\193\33\14\204\219\217", "\164\128\99\66\137\159");
				StarterGui:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\35\129\232\170\45\136\226\187\51\144\250\170\5\132\196\187\19\154\232\185\5", "\222\96\233\137"), privateProperties);
			elseif (enabled and ((spyOnMyself == true) or (p ~= player))) then
				msg = msg:gsub("[\n\r]", ""):gsub("\t", " "):gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\130\243\154\84", "\144\217\211\199\127\232\147"), " ");
				local hidden = true;
				local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
					if ((packet.SpeakerUserId == p.UserId) and (packet.Message == msg:sub((#msg - #packet.Message) + 1)) and ((channel == LUAOBFUSACTOR_DECRYPT_STR_0("\217\35\50", "\36\152\79\94\72\181\37\98")) or ((channel == LUAOBFUSACTOR_DECRYPT_STR_0("\227\221\70\50", "\95\183\184\39")) and (public == false) and (Players[packet.FromSpeaker].Team == player.Team)))) then
						hidden = false;
					end
				end);
				wait(1);
				conn:Disconnect();
				if (hidden and enabled) then
					if public then
						saymsg:FireServer(((publicItalics and "/me ") or "") .. LUAOBFUSACTOR_DECRYPT_STR_0("\174\12\215\31\73\192\57", "\98\213\95\135\70\52\224") .. p.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\195\249\137", "\52\158\195\169\23") .. msg, LUAOBFUSACTOR_DECRYPT_STR_0("\91\176\62", "\235\26\220\82\20\230\85\27"));
					else
						privateProperties.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\147\146\217\251\105\200\154", "\20\232\193\137\162") .. p.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\31\133\133", "\17\66\191\165\198\135\236\119") .. msg;
						StarterGui:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\44\167\175\7\210\233\231\212\60\182\189\7\250\229\193\212\28\188\175\20\250", "\177\111\207\206\115\159\136\140"), privateProperties);
					end
				end
			end
		end
	end
	for _, p in ipairs(Players:GetPlayers()) do
		p.Chatted:Connect(function(msg)
			onChatted(p, msg);
		end);
	end
	Players.PlayerAdded:Connect(function(p)
		p.Chatted:Connect(function(msg)
			onChatted(p, msg);
		end);
	end);
	privateProperties.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\30\186\32\45\148", "\63\101\233\112\116\180\47") .. ((enabled and LUAOBFUSACTOR_DECRYPT_STR_0("\230\21", "\86\163\91\141\114\152")) or LUAOBFUSACTOR_DECRYPT_STR_0("\119\34\71", "\90\51\107\20\19")) .. LUAOBFUSACTOR_DECRYPT_STR_0("\172\210\169\202\25\144", "\93\237\144\229\143");
	StarterGui:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\54\254\241\13\38\71\30\243\195\0\24\82\16\251\221\28\24\85\20\241\245", "\38\117\150\144\121\107"), privateProperties);
	local chatFrame = player.PlayerGui.Chat.Frame;
	chatFrame.ChatChannelParentFrame.Visible = true;
	chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y);
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\3\186\227\63", "\90\77\219\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\192\17\45\53\12\37\104\239\3\41\45", "\26\134\100\65\89\44\103"),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\226\60\47\166\240\224\59", "\196\145\131\80\67")]=function()
	Game.Lighting.Brightness = 4;
	Game.Lighting.FogEnd = 100000;
	Game.Lighting.GlobalShadows = false;
	Game.Lighting.ClockTime = 12;
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\48\177\11\13", "\136\126\208\102\104\120")]=LUAOBFUSACTOR_DECRYPT_STR_0("\74\133\219\77\171\18\56\95\124\202\218\74\162\87\46", "\49\24\234\174\35\207\50\93"),[LUAOBFUSACTOR_DECRYPT_STR_0("\47\243\241\132\115\13\241\246", "\17\108\146\157\232")]=function()
	makeNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\98\205\18\226", "\200\43\163\116\141\79"), LUAOBFUSACTOR_DECRYPT_STR_0("\135\51\51\140\190\180\203\138\20\125\159\240\217\226\175", "\131\223\86\93\227\208\148"), LUAOBFUSACTOR_DECRYPT_STR_0("\209\74\163\184\25\245\244\76\186\186\93\176\237\65\246\191\19\245", "\213\131\37\214\214\125") .. game.Players.LocalPlayer.PlayerGui:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\14\30\1", "\129\70\75\69\223")).Center.Vote.Info.Read.Timer.Text);
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\104\202\254\236", "\143\38\171\147\137\28")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\141\249\196\2\247\209\194\194\157\242\14\226\211\213", "\180\176\226\217\147\99\131"),[LUAOBFUSACTOR_DECRYPT_STR_0("\240\184\35\11\209\184\44\12", "\103\179\217\79")]=function()
	if getgenv().nodmg then
		return;
	end
	getgenv().nodmg = true;
	nowaterdmg(game.Players.LocalPlayer.Character);
	game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
		repeat
			task.wait();
		until char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\98\162\17\212\79\131\170\78\133\19\218\85\188\162\88\163", "\195\42\215\124\181\33\236")) 
		nowaterdmg(char);
	end);
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\35\88\58\59", "\152\109\57\87\94\69")]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\210\6\166\174\221\70\188\185\195\5\227\145\208\94\173\250\195\3\181\187", "\200\153\183\106\195\222\178\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\17\226\132\49\75\91\49\232", "\58\82\131\232\93\41")]=function()
	hrp = game.Players.LocalPlayer.Character.HumanoidRootPart;
	if workspace.Game.Map.Parts:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\172\85\218\16\94\43\138\65\213\6", "\95\227\55\176\117\61")) then
		for i, v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
			if v.IsA(v, LUAOBFUSACTOR_DECRYPT_STR_0("\53\113\39\78\167", "\203\120\30\67\43")) then
				hrp.CFrame = CFrame.new(v:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\211\36\94\234\233\240\55\89", "\185\145\69\45\143")).Position);
			end
		end
	end
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\164\30\20\163", "\188\234\127\121\198")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\55\31\134\40\61\1\151\120\38\28\195\19\60\28\128\51", "\227\88\82\115"),[LUAOBFUSACTOR_DECRYPT_STR_0("\96\30\182\171\0\114\64\20", "\19\35\127\218\199\98")]=function()
	for i, v in next, workspace.Game.Players:GetChildren() do
		if v:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\56\244\29\236\25\255", "\130\124\155\106")) then
			pcall(function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position);
			end);
		end
	end
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\251\202\251\170", "\223\181\171\150\207\195\150\28")]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\42\240\238\43\67\53\240\186", "\105\44\90\131\206"),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\225\190\181\10\63\252\235", "\94\159\128\210\217\104")]=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubfpsboost"))();
end});
local Tab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\113\236\18\176\31\89\248\104\93", "\26\48\153\102\223\63\31\153"), 4483362458);
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\44\65\224\246", "\147\98\32\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\57\86\247\197\70\112\74\10\78\163\253\15\88", "\43\120\35\131\170\102\54"),[LUAOBFUSACTOR_DECRYPT_STR_0("\119\19\149\164\160\190\144\98\7\139\163\160", "\228\52\102\231\214\197\208")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\56\236\116\205", "\182\126\128\21\170\138\235\121")]=LUAOBFUSACTOR_DECRYPT_STR_0("\191\213\50\225\138\22\99", "\102\235\186\85\134\230\115\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\116\13\50\83\112\213\33\92", "\66\55\108\94\63\18\180")]=function(bbb)
	getgenv().breakbots = bbb;
	bb();
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\58\140\136\50", "\57\116\237\229\87\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("\143\167\232\233\99\174\97\171\163\224", "\39\202\209\141\135\23\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\38\27\24\55\246\235\5\8\6\39\253", "\152\159\83\105\106\82")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\167\202\80\245", "\60\225\166\49\146\169")]=LUAOBFUSACTOR_DECRYPT_STR_0("\27\17\40\45\13\2\120", "\103\79\126\79\74\97"),[LUAOBFUSACTOR_DECRYPT_STR_0("\153\126\223\127\92\27\185\116", "\122\218\31\179\19\62")]=function(TF)
	getgenv().tf = TF;
	if tf then
		makeNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\164\215\223\207\192\175\66", "\37\211\182\173\161\169\193"), LUAOBFUSACTOR_DECRYPT_STR_0("\207\63\67\214\38\59\145\226\56\13\197\104\93\184\229\55", "\217\151\90\45\185\72\27"), 'Please click on "Auto Respawn" in the GUI to avoid breaking');
		part = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\243\125\245\6", "\54\163\28\135\114"), workspace);
		part.Anchored = true;
	end
	while task.wait(0.5) and getgenv().tf do
		if not tf then
			break;
		end
		local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();
		local tickets = workspace.Game.Effects.Tickets;
		local hrp = char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\0\206\80\131\64\112\33\223\111\141\65\107\24\218\79\150", "\31\72\187\61\226\46"), 3);
		if (hrp == nil) then
			return;
		end
		for i, v in next, tickets:GetDescendants() do
			if (v.IsA(v, LUAOBFUSACTOR_DECRYPT_STR_0("\225\7\80\215\119\127\54\215", "\68\163\102\35\178\39\30")) and (v.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\150\101\215\198\13\186\138\21\140\127\213\211\51\180\145\5", "\113\222\16\186\167\99\213\227"))) then
				hrp.CFrame = CFrame.new(v.Position);
			end
		end
	end
end});
local Tab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\11\61\203", "\150\78\110\155"), 4483362458);
local Section = Tab:CreateSection(LUAOBFUSACTOR_DECRYPT_STR_0("\160\246\23", "\32\229\165\71\129\196\126\223"));
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\237\136\201\132", "\181\163\233\164\225\225")]=LUAOBFUSACTOR_DECRYPT_STR_0("\117\152\46\55\126\138\51\114", "\23\48\235\94"),[LUAOBFUSACTOR_DECRYPT_STR_0("\95\219\212\81\85\50\209\119", "\178\28\186\184\61\55\83")]=function(value)
	local c = workspace.CurrentCamera;
	local ps = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\244\193\70\37\247\28\230", "\149\164\173\39\92\146\110"));
	local lp = ps.LocalPlayer;
	local rs = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\193\50\30\44\31\9\229\46\19\26", "\123\147\71\112\127\122"));
	local function getdistancefc(part)
		return (part.Position - c.CFrame.Position).Magnitude;
	end
	local function esp(p, cr)
		local h = cr:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\228\216\143\112\72\195\196\134", "\38\172\173\226\17"));
		local hrp = cr:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\101\4\33\238\67\30\37\235\127\30\35\251\125\16\62\251", "\143\45\113\76"));
		local text = Drawing.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\189\4\40", "\92\216\216\124"));
		text.Visible = false;
		text.Center = true;
		text.Outline = true;
		text.Font = 2;
		text.Color = Color3.fromRGB(255, 255, 255);
		text.Size = 17;
		local c1;
		local c2;
		local c3;
		local function dc()
			text.Visible = false;
			text:Remove();
			if c1 then
				c1:Disconnect();
				c1 = nil;
			end
			if c2 then
				c2:Disconnect();
				c2 = nil;
			end
			if c3 then
				c3:Disconnect();
				c3 = nil;
			end
		end
		c2 = cr.AncestryChanged:Connect(function(_, parent)
			if not parent then
				dc();
			end
		end);
		c3 = h.HealthChanged:Connect(function(v)
			if ((v <= 0) or (h:GetState() == Enum.HumanoidStateType.Dead)) then
				dc();
			end
		end);
		c1 = rs.RenderStepped:Connect(function()
			local hrp_pos, hrp_os = c:WorldToViewportPoint(hrp.Position);
			if hrp_os then
				text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y);
				text.Text = p.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\27\122", "\157\59\82\204\32") .. tostring(math.floor(getdistancefc(hrp))) .. LUAOBFUSACTOR_DECRYPT_STR_0("\120\51\170", "\209\88\94\131\154\137\138\179");
				text.Visible = true;
			else
				text.Visible = false;
			end
		end);
	end
	local function p_added(p)
		if p.Character then
			esp(p, p.Character);
		end
		p.CharacterAdded:Connect(function(cr)
			esp(p, cr);
		end);
	end
	for i, p in next, ps:GetPlayers() do
		if (p ~= lp) then
			p_added(p);
		end
	end
	ps.PlayerAdded:Connect(p_added);
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\6\160\201\121", "\66\72\193\164\28\126\67\81")]=LUAOBFUSACTOR_DECRYPT_STR_0("\194\63\184\24\21\125\226\32\173\76\41\120", "\22\135\76\200\56\70"),[LUAOBFUSACTOR_DECRYPT_STR_0("\174\49\244\40\95\224\142\59", "\129\237\80\152\68\61")]=function()
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/UniversalSkeleton.lua"))();
	local Skeletons = {};
	for _, Player in next, game.Players:GetChildren() do
		table.insert(Skeletons, Library:NewSkeleton(Player, true));
	end
	game.Players.PlayerAdded:Connect(function(Player)
		table.insert(Skeletons, Library:NewSkeleton(Player, true));
	end);
end});
local Button = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\127\169\9\246", "\56\49\200\100\147\124\119")]=LUAOBFUSACTOR_DECRYPT_STR_0("\233\45\175\176\238\49\167", "\144\172\94\223"),[LUAOBFUSACTOR_DECRYPT_STR_0("\7\14\174\75\38\14\161\76", "\39\68\111\194")]=function(value)
	local Settings = {[LUAOBFUSACTOR_DECRYPT_STR_0("\244\169\255\248\90\184\218\169\245", "\215\182\198\135\167\25")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\175\70\242\119\185\65\227\75\134\71\239\91\158", "\40\237\41\138")]=2,[LUAOBFUSACTOR_DECRYPT_STR_0("\243\113\251\245\117\228\124\255\251\65", "\42\167\20\154\152")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\126\251\163\79\78\2\69\242\173\80", "\65\42\158\194\34\17")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\59\50\70\3\57\229\18\237\17\41\87\31\62", "\142\122\71\50\108\77\141\123")]=true};
	local Space = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\34\173\237\19\40\5\163\252\29", "\91\117\194\159\120"));
	local Player = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\42\17\63\1\48\227\55", "\68\122\125\94\120\85\145")).LocalPlayer;
	local Camera = Space.CurrentCamera;
	local function NewLine(color, thickness)
		local line = Drawing.new(LUAOBFUSACTOR_DECRYPT_STR_0("\59\21\193\91", "\218\119\124\175\62\168\185"));
		line.Visible = false;
		line.From = Vector2.new(0, 0);
		line.To = Vector2.new(0, 0);
		line.Color = color;
		line.Thickness = thickness;
		line.Transparency = 1;
		return line;
	end
	local function Vis(lib, state)
		for i, v in pairs(lib) do
			v.Visible = state;
		end
	end
	local function Colorize(lib, color)
		for i, v in pairs(lib) do
			v.Color = color;
		end
	end
	local Black = Color3.fromRGB(0, 0, 0);
	local function Rainbow(lib, delay)
		for hue = 0, 1, 1 / 30 do
			local color = Color3.fromHSV(hue, 0.6, 1);
			Colorize(lib, color);
			wait(delay);
		end
		Rainbow(lib);
	end
	local function Main(plr)
		repeat
			wait();
		until (plr.Character ~= nil) and (plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\141\229\69\197\171\255\65\192", "\164\197\144\40")) ~= nil) 
		local R15;
		if (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15) then
			R15 = true;
		else
			R15 = false;
		end
		local Library = {[LUAOBFUSACTOR_DECRYPT_STR_0("\183\220\251", "\214\227\144\202\235\189")]=NewLine(Settings.Box_Color, Settings.Box_Thickness),[LUAOBFUSACTOR_DECRYPT_STR_0("\217\137\213", "\92\141\197\231\27\112\211\51")]=NewLine(Settings.Box_Color, Settings.Box_Thickness),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\205\219", "\177\134\159\234\195")]=NewLine(Settings.Box_Color, Settings.Box_Thickness),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\217\109", "\169\221\139\95\192")]=NewLine(Settings.Box_Color, Settings.Box_Thickness),[LUAOBFUSACTOR_DECRYPT_STR_0("\252\167\46", "\70\190\235\31\95\66")]=NewLine(Settings.Box_Color, Settings.Box_Thickness),[LUAOBFUSACTOR_DECRYPT_STR_0("\152\206\72", "\133\218\130\122\134")]=NewLine(Settings.Box_Color, Settings.Box_Thickness),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\205\178", "\88\92\159\131\164\188\195")]=NewLine(Settings.Box_Color, Settings.Box_Thickness),[LUAOBFUSACTOR_DECRYPT_STR_0("\162\28\237", "\189\224\78\223\43\183\139")]=NewLine(Settings.Box_Color, Settings.Box_Thickness)};
		coroutine.wrap(Rainbow)(Library, 0.15);
		local oripart = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\30\253\152\2", "\161\78\156\234\118"));
		oripart.Parent = Space;
		oripart.Transparency = 1;
		oripart.CanCollide = false;
		oripart.Size = Vector3.new(1, 1, 1);
		oripart.Position = Vector3.new(0, 0, 0);
		local function Updater()
			local c;
			c = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\149\162\199\239\162\165\223\213\164\178", "\188\199\215\169")).RenderStepped:Connect(function()
				if ((plr.Character ~= nil) and (plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\212\28\82\122\230\243\0\91", "\136\156\105\63\27")) ~= nil) and (plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\51\153\116\53\21\131\112\48\41\131\118\32\43\141\107\32", "\84\123\236\25")) ~= nil) and (plr.Character.Humanoid.Health > 0) and (plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\216\142\171\19", "\213\144\235\202\119\204")) ~= nil)) then
					local Hum = plr.Character;
					local HumPos, vis = Camera:WorldToViewportPoint(Hum.HumanoidRootPart.Position);
					if vis then
						oripart.Size = Vector3.new(Hum.HumanoidRootPart.Size.X, Hum.HumanoidRootPart.Size.Y * 1.5, Hum.HumanoidRootPart.Size.Z);
						oripart.CFrame = CFrame.new(Hum.HumanoidRootPart.CFrame.Position, Camera.CFrame.Position);
						local SizeX = oripart.Size.X;
						local SizeY = oripart.Size.Y;
						local TL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, SizeY, 0)).p);
						local TR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, SizeY, 0)).p);
						local BL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, -SizeY, 0)).p);
						local BR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, -SizeY, 0)).p);
						if Settings.Team_Check then
							if (plr.TeamColor == Player.TeamColor) then
								Colorize(Library, Color3.fromRGB(0, 255, 0));
							else
								Colorize(Library, Color3.fromRGB(255, 0, 0));
							end
						end
						if Settings.Team_Color then
							Colorize(Library, plr.TeamColor.Color);
						end
						local ratio = (Camera.CFrame.p - Hum.HumanoidRootPart.Position).magnitude;
						local offset = math.clamp((1 / ratio) * 750, 2, 300);
						Library.TL1.From = Vector2.new(TL.X, TL.Y);
						Library.TL1.To = Vector2.new(TL.X + offset, TL.Y);
						Library.TL2.From = Vector2.new(TL.X, TL.Y);
						Library.TL2.To = Vector2.new(TL.X, TL.Y + offset);
						Library.TR1.From = Vector2.new(TR.X, TR.Y);
						Library.TR1.To = Vector2.new(TR.X - offset, TR.Y);
						Library.TR2.From = Vector2.new(TR.X, TR.Y);
						Library.TR2.To = Vector2.new(TR.X, TR.Y + offset);
						Library.BL1.From = Vector2.new(BL.X, BL.Y);
						Library.BL1.To = Vector2.new(BL.X + offset, BL.Y);
						Library.BL2.From = Vector2.new(BL.X, BL.Y);
						Library.BL2.To = Vector2.new(BL.X, BL.Y - offset);
						Library.BR1.From = Vector2.new(BR.X, BR.Y);
						Library.BR1.To = Vector2.new(BR.X - offset, BR.Y);
						Library.BR2.From = Vector2.new(BR.X, BR.Y);
						Library.BR2.To = Vector2.new(BR.X, BR.Y - offset);
						Vis(Library, true);
						if Settings.Autothickness then
							local distance = (Player.Character.HumanoidRootPart.Position - oripart.Position).magnitude;
							local value = math.clamp((1 / distance) * 100, 1, 4);
							for u, x in pairs(Library) do
								x.Thickness = value;
							end
						else
							for u, x in pairs(Library) do
								x.Thickness = Settings.Box_Thickness;
							end
						end
					else
						Vis(Library, false);
					end
				else
					Vis(Library, false);
					if (game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\19\20\223\51\45\49\94", "\45\67\120\190\74\72\67")):FindFirstChild(plr.Name) == nil) then
						for i, v in pairs(Library) do
							v:Remove();
							oripart:Destroy();
						end
						c:Disconnect();
					end
				end
			end);
		end
		coroutine.wrap(Updater)();
	end
	for i, v in pairs(game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\16\46\236\188\252\154\253", "\137\64\66\141\197\153\232\142")):GetPlayers()) do
		if (v.Name ~= Player.Name) then
			coroutine.wrap(Main)(v);
		end
	end
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\51\220\35\191\141\17\195", "\232\99\176\66\198")).PlayerAdded:Connect(function(newplr)
		coroutine.wrap(Main)(newplr);
	end);
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\194\32\37\3", "\76\140\65\72\102\27\237\153")]=LUAOBFUSACTOR_DECRYPT_STR_0("\111\201\6\146\245\14\170", "\222\42\186\118\178\183\97"),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\249\86\152\88\226\80\188\92\224\81\143", "\234\61\140\36")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\7\209\187\117", "\111\65\189\218\18")]=LUAOBFUSACTOR_DECRYPT_STR_0("\119\68\28\50\7\89\251", "\207\35\43\123\85\107\60"),[LUAOBFUSACTOR_DECRYPT_STR_0("\83\171\172\230\123\113\169\171", "\25\16\202\192\138")]=function(besp)
	getgenv().botesp = besp;
	task.spawn(function()
		while task.wait() do
			ClearESP(LUAOBFUSACTOR_DECRYPT_STR_0("\220\226\146\214\187\245\254\192\168\240", "\148\157\171\205\130\201"));
			if not getgenv().botesp then
				break;
			end
			pcall(function()
				local GamePlayers = workspace.Game.Players;
				for i, v in pairs(GamePlayers:GetChildren()) do
					if not game.Players:FindFirstChild(v.Name) then
						Simple_Create(v.HumanoidRootPart, v.Name, LUAOBFUSACTOR_DECRYPT_STR_0("\2\253\75\29\195\247\32\223\113\59", "\150\67\180\20\73\177"));
					end
				end
			end);
		end
	end);
end});
local Toggle = Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\163\25\23\72", "\45\237\120\122")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\251\178\108\252\230\173\47\220", "\76\183\136\194"),[LUAOBFUSACTOR_DECRYPT_STR_0("\89\243\247\42\85\65\0\76\231\233\45\85", "\116\26\134\133\88\48\47")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\56\205\161\227", "\18\126\161\192\132\221")]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\39\169\3\90\90\125", "\54\63\72\206\100"),[LUAOBFUSACTOR_DECRYPT_STR_0("\235\88\73\118\231\122\203\82", "\27\168\57\37\26\133")]=function(desp)
	getgenv().downesp = desp;
	task.spawn(function()
		while task.wait() do
			ClearESP(LUAOBFUSACTOR_DECRYPT_STR_0("\9\165\107\166\210\41\149\89\155\231", "\183\77\202\28\200"));
			if not getgenv().downesp then
				break;
			end
			pcall(function()
				local GamePlayers = workspace:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\48\50\132\13", "\104\119\83\233"), 1337).Players;
				for i, v in pairs(GamePlayers:GetChildren()) do
					if v:GetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\209\247\48\44\70\241", "\35\149\152\71\66")) then
						Simple_Create(v.HumanoidRootPart, LUAOBFUSACTOR_DECRYPT_STR_0("\50\230\77\179\49\67\168", "\90\121\136\34\208") .. v.Name, LUAOBFUSACTOR_DECRYPT_STR_0("\227\1\66\16\194\10\106\59\244\62", "\126\167\110\53"));
					end
				end
			end);
		end
	end);
end});
game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\15\5\32\203\217\45\43\25\45\253", "\95\93\112\78\152\188")).RenderStepped:Connect(function()
	pcall(function()
		if (game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0) then
			game.Players.LocalPlayer.Character:TranslateBy((game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed) / 100);
		end
	end);
end);
workspace.Game.ChildAdded:Connect(function(v)
	if ((v.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\236\244\149", "\178\161\149\229\117\132\222")) and tspam) then
		task.wait(32);
		while tspam and task.wait() do
			if not tspam then
				break;
			end
			for i, v in next, workspace.Game.Players:GetChildren() do
				if (v and v:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\173\202\200\165\177", "\67\232\187\189\204\193\118\198"))) then
					v:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\174\63\160\41\43", "\143\235\78\213\64\91\98")):InvokeServer(2);
				end
			end
		end
	end
end);
