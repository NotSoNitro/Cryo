while task.wait() do
	local Time = os.date("*t", os.time())
	local hr,min = Time.hour, Time.min
	
	if hr < 10 then
		hr = "0"..hr
	end
	if min < 10 then
		min = "0"..min
	end

	local label = script.Parent

	label.Text = hr..":"..min
end