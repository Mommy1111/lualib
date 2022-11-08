# lualib

# gamepass purchase

code:

local h = game:GetService('HttpService)
loadstring(h:GetAsync('https://raw.githubusercontent.com/Mommy1111/lualib/main/purchase.lua'))

usage : 

local p = prompt_gamepass( game pass id , player (instance) , text color (string) , text to appear when purchase succeded (string) , text to appear when player own gamepass (string) , text to appear when when purchase is cancelled (string) )

print(p) -- when true then purchase succeded if false purchase cancelled or player own gamepass
