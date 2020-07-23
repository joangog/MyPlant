--Data
name="My Plant"
age=-1
maxhealth=20
health=maxhealth
stage=0
drought=0
err="null"

function updateAge()
	if tonumber(health)>0 then age=age+1 end
end

function updateStage()
	--testing
	k=20

	ageint=tonumber(age)
	if ageint<1*k then stage=0
	elseif ageint>=1*k and ageint<2*k then stage=1
	elseif ageint>=2*k and ageint<3*k then stage=2
	elseif ageint>=3*k then stage=3
	end
end

function updateDrought()
	--testing
	k=10

	healthint=tonumber(health)
	if healthint==0 then drought=2
	elseif healthint>=0 and healthint<1*k then drought=1
	elseif healthint>=1*k then drought=0
	end
end


function updateHealth()
	if tonumber(health)>0 then health=health-1 end
end

function resetHealth()
	health=maxhealth
end

function saveData()
	file=io.open("Skins\\MyPlant\\data.txt","w")
	file:write(name.."\n"..age.."\n"..health)
	file:close()
end

function loadData()
	file=io.open("Skins\\MyPlant\\data.txt","r")

	if file==nil then
		err="No file found"
		file.close()
		saveData() --create new plant data
	else
	file=io.open("Skins\\MyPlant\\data.txt","r")
	name=file:read()
	age=file:read()
	health=file:read()
	file:close()
	end
end

function Initialize()
	loadData()
end

function Update()
	updateAge()
	updateHealth()
	updateStage()
	updateDrought()
	saveData()
end

