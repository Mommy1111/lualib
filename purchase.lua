local function prompt_gamepass(id,plr,txt_color,txt_sucess,txt_owned,txt_cancelled)
	local service = game:GetService('MarketplaceService')
	local gui = Instance.new('ScreenGui',plr.PlayerGui)
	gui.Name = 'purchase'
	local textlabel = Instance.new('TextLabel',gui)
	textlabel.Position = UDim2.new(0.5,0,0.5,0)
	textlabel.AnchorPoint = Vector2.new(0.5,0.5)
	textlabel.TextScaled = true
	textlabel.BackgroundTransparency = 1
	textlabel.TextColor3 = Color3.new(tonumber(txt_color))
	textlabel.Visible = false
	textlabel.Size = UDim2.new(0.265, 0,0.055, 0)
	local blur = Instance.new('BlurEffect',game:GetService('Lighting'))
	if service:UserOwnsGamePassAsync(plr.UserId,id) then
		textlabel.Text = txt_owned
		textlabel.Visible = true
		wait(5)
		blur:Destroy()
        textlabel.Visible = false
		return false
	else
		service:PromptGamePassPurchase(plr,id)
		service.PromptGamePassPurchaseFinished:Connect(function(player,passid,suces)
			if player.UserId == plr.UserId and passid == id then
				if suces == true then
					textlabel.Text = txt_sucess
					textlabel.Visible = true
					wait(5)
					blur:Destroy()
                    textlabel.Visible = false
					return true
				else
					textlabel.Text = txt_cancelled
					textlabel.Visible = true
					wait(5)
					blur:Destroy()
                    textlabel.Visible = false
					return false
				end
			end
		end)
	end
end
