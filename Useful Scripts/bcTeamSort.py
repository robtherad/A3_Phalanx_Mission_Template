import math, time, random, Tkinter, tkMessageBox, unicodedata, sys
sys.stdout = open("my_stdout.log", "w")
sys.stderr = open("my_stderr.log", "w")

#SUM = 76
#DESIRED HALFSUM = 38
#These inputs are able to make the DESIRED HALFSUM with the combination:
#T1int: 20,9,5,4 ||| T2int: 17,11,7,3
#inputNums = [5,9,4,3,7,20,17,11]

#inputDict = {23: 'BC', 9: '29th', 8:'10th', 6:'myrc',11:'g1',3:'g2',5:'g3',2:'g4'}
#inputNums = [23,9,8,6,11,3,5,2]

def parse_input():
	#Verify that the 'Player Advantage' input is valid
	try:
		desiredPlayerAdvantage = int(inputLittleBoxvar.get())
	except ValueError:
		tkMessageBox.showerror( "Player Advantage - ValueError","Please only enter integers into the 'Player Advantage' box!\n\nGOOD:\t1\n\nBAD:\t1.0")
		raise
	except IndexError:
		tkMessageBox.showerror( "Player Advantage - IndexError","Please only enter integers into the 'Player Advantage' box!")
		raise
		
	#Verify that the 'Input Box' input is valid
	try:
		print ""
		print "===== Function parse_input ====="
		inputTexts = inputBox.get("1.0",'end-1c')
		inputTexts = inputTexts.encode('ascii','ignore')
		print inputTexts
		splitStringList = inputTexts.split('\n')
		splitLength = len(splitStringList)
		inputDict = {}
		inputList = []
		for i in range(0,len(splitStringList)):
			tempSplit = splitStringList[i].split(' - ')
			inputList.append(int(tempSplit[1]))
			inputDict[tempSplit[0]] = int(tempSplit[1])
	except ValueError:
		tkMessageBox.showerror( "Input Box - ValueError 01","Format was not followed! Make sure you only use integers for the player counts of groups!\n\nGOOD:\tBC - 20\n\nBAD:\tBC - 20.0")
		raise
	except IndexError:
		tkMessageBox.showerror( "Input Box - IndexError 01","Format was not followed!\n\n-Make sure there are no extra lines in the 'Input Box'!\n-Don't use a hyphen surrounded by spaces in group names!\n-Make sure you use the correct format for inputs!\n\nGOOD:\tBC - 20\n\nBAD:\tBC-20\n\nBAD:\tBravo - Company - 20")
		raise
	#Check to see if any groups were entered twice
	if (len(inputDict) != len(inputList)):
		tkMessageBox.showerror( "Input Box - TypeError 01","You entered two groups with the same name into the 'Input Box'! Fix it!")
		return
	#Check to see if there are at least 2 groups
	if (len(inputList) < 2):
		tkMessageBox.showerror( "Input Box - TypeError 02","Please enter more than one group into the 'Input Box'!")
		return
	sort_teams(inputList,inputDict,desiredPlayerAdvantage)
	
	
def sort_teams(inputNums,inputDict,desiredPlayerAdvantage):
	print ""
	print "===== Function sort_teams ====="
	print " Perfect solution - %s" % desiredPlayerAdvantage
	currentPlayerAdvantage = sum(inputNums)
	sortedTeams = [[],[]]
	bestSortedTeams = [[],[]]
	loopCount = 600
	for looper in range(1,loopCount+1):
		#Generate two teams
		workingInput = sorted(inputNums, reverse=True)
		T1int = []
		T2int = []
		if looper < loopCount/4:
			#For the first 25% of attempts try to help produce a favorable result by sorting biggest 2 values first
			T1int.append(workingInput.pop(0))
			T2int.append(workingInput.pop(0))
		i = 0
		tries = 0
		#While there are still teams to sort:
		while len(workingInput) > 0:					
			#T1 is attackers, T2 is defenders
			#If the difference between the number of players on T1 compared to T2 is less than the desiredPlayerAdvantage add players to T1
			if (sum(T1int) - sum(T2int)) <= desiredPlayerAdvantage:
				#Work with T1int
				ranNum = random.randint(0,len(workingInput)-1)
				T1int.append(workingInput.pop(random.randint(0,len(workingInput)-1)))
			else:
				#Work with T2int
				ranNum = random.randint(0,len(workingInput)-1)
				T2int.append(workingInput.pop(ranNum))
		#Check if difference between the two teams is equal to the desired difference
		if sum(T1int)-sum(T2int) == desiredPlayerAdvantage:
			print " SUCESS - Found perfect solution (%s) after %s tries" % (desiredPlayerAdvantage,looper)
			#Found perfect solution - exit
			sortedTeams = [T1int,T2int]
			currentPlayerAdvantage = desiredPlayerAdvantage
			break
		else:
			if abs(abs((sum(T1int)-sum(T2int))) - desiredPlayerAdvantage) < abs(currentPlayerAdvantage - desiredPlayerAdvantage):
				bestSortedTeams = [T1int,T2int]
				currentPlayerAdvantage = abs(sum(T1int)-sum(T2int))
				print " -- Found new best - %s difference" % currentPlayerAdvantage
		#Check if loop is about to exit without perfect solution
		if looper == loopCount:
			print " FAILURE - Tried %s times to find perfect solution but did not" % looper
			sortedTeams = bestSortedTeams
	build_string(sortedTeams,inputDict,currentPlayerAdvantage)
	
def build_string(sortedTeams,inputDict,currentPlayerAdvantage):
	print ""
	print "===== Function build_string ====="
	builtStringList = []
	string = ""
	lineBreak = "\n"
	playerString = " players"
	fillString = " - "
	
	sortedTeams[0] = sorted(sortedTeams[0], reverse=True)
	sortedTeams[1] = sorted(sortedTeams[1], reverse=True)
	inputDictItems = inputDict.items()
	#
	advantageString = "Player Advantage%s%s players\n=============================\n" % (fillString,currentPlayerAdvantage)
	builtStringList.append(advantageString)
	
	#Loop through Team 1 entries
	teamString = "Attacking Team%s%s players\n\n" % (fillString,sum(sortedTeams[0]))
	builtStringList.append(teamString)
	for k in sortedTeams[0]:
		z = int(k)
		for b in range(0,len(inputDictItems)):
			if z in inputDictItems[b]:
				tempDict = inputDictItems.pop([b][0])
				tempDict = tempDict[0]
				tempDict = str(tempDict)
				x = str(k)
				tempStringList = [tempDict,fillString,x,playerString,lineBreak]
				tempString = string.join(tempStringList)
				builtStringList.append(tempString)
				break
	#Repeat for Team 2
	teamString = "-----------------------------\nDefending Team%s%s players\n\n" % (fillString,sum(sortedTeams[1]))
	builtStringList.append(teamString)
		
	for k in sortedTeams[1]:
		z = int(k)
		for b in range(0,len(inputDictItems)):
			if z in inputDictItems[b]:
				tempDict = inputDictItems.pop([b][0])
				tempDict = tempDict[0]
				tempDict = str(tempDict)
				x = str(k)
				tempStringList = [tempDict,fillString,x,playerString,lineBreak]
				tempString = string.join(tempStringList)
				builtStringList.append(tempString)
				break
	builtString = string.join(builtStringList)
	outputBox.delete("1.0",Tkinter.END)
	outputBox.insert(Tkinter.INSERT, builtString)
	print "Done!"

def reset_values():
	print ""
	print "===== Function reset_values ====="
	#Reset desiredPlayerAdvantage box
	inputLittleBoxvar.set("0")
	#Reset output box
	outputBox.delete("1.0",Tkinter.END)
	outputBox.insert(Tkinter.INSERT, "In the 'Input Box' type in the name of a group and how many players they have present. Then at the top type a number into the 'Player Advantage' box to set how many players the attackers should have compared to another. Once you are ready, press the 'Sort Teams' button above it to sort the teams into two sides with a difference in players determined by what you entered into the 'Player Advantage' box. If the program wasn't able to perfectly sort the groups into two teams with your 'Player Advantage' number it will come as close as it can.\n\nUse the format [GROUP NAME] - [GROUP PLAYER COUNT] to enter groups into the input box. An example input is shown below:\nBravo Co. - 20\nCharlie Co. - 7\nDelta Co. - 5\nEcho Co. - 9\nFox Co. - 7\nGolf Co. - 5\nHotel Co. - 4\nIndia Co. - 3")
	
#Start GUI Loop
root = Tkinter.Tk()
root.title("[BC] Team Sorter - v1 - by robtherad")
root.resizable(0,0)

frame = Tkinter.Frame(root)
frame.grid()

#Input Big Box
inframe = Tkinter.Frame(frame,bd=4)
inframe.grid(row=2,column=0,columnspan=3)

inputScroll = Tkinter.Scrollbar(inframe,bg='#000000',highlightbackground='#000000')
inputScroll.grid(row=3,column=6,sticky=Tkinter.NS)

inputBox = Tkinter.Text(inframe,wrap=Tkinter.WORD,width=70,height=25,yscrollcommand=inputScroll.set)
inputBox.grid(row=3,column=0,columnspan=3,sticky=Tkinter.N+Tkinter.S+Tkinter.E+Tkinter.W)
inputBox.insert(Tkinter.INSERT, "Bravo Co. - 20\nCharlie Co. - 7\nDelta Co. - 5\nEcho Co. - 9\nFox Co. - 7\nGolf Co. - 5\nHotel Co. - 4\nIndia Co. - 3")

inputBoxLabelvar = Tkinter.StringVar()
inputBoxLabel = Tkinter.Label( inframe, textvariable=inputBoxLabelvar,padx=5,pady=0)
inputBoxLabelvar.set("Input Box")
inputBoxLabel.grid(row=2,column=1,sticky=Tkinter.N+Tkinter.S+Tkinter.E+Tkinter.W)

#Output Big Box
outframe = Tkinter.Frame(frame,bd=4)
outframe.grid(row=2,column=4,columnspan=3)

outputScroll = Tkinter.Scrollbar(outframe,bg='#000000',activebackground='#000000',troughcolor='#000000',highlightcolor='#000000')
outputScroll.grid(row=3,column=6,sticky=Tkinter.NS)

outputBox = Tkinter.Text(outframe,wrap=Tkinter.WORD,width=70,height=25,yscrollcommand=outputScroll.set)
outputBox.grid(row=3,column=3,columnspan=3,sticky=Tkinter.N+Tkinter.S+Tkinter.E+Tkinter.W)
outputBox.insert(Tkinter.INSERT, "In the 'Input Box' type in the name of a group and how many players they have present. Then at the top type a number into the 'Player Advantage' box to set how many players the attackers should have compared to another. Once you are ready, press the 'Sort Teams' button above it to sort the teams into two sides with a difference in players determined by what you entered into the 'Player Advantage' box. If the program wasn't able to perfectly sort the groups into two teams with your 'Player Advantage' number it will come as close as it can.\n\nUse the format [GROUP NAME] - [GROUP PLAYER COUNT] to enter groups into the input box. An example input is shown in the 'Input Box'. If you have already deleted the example input, press the 'Show Instructions' button at the top right to display the example input in this box.")

outputBoxLabelvar = Tkinter.StringVar()
outputBoxLabel = Tkinter.Label(outframe, textvariable=outputBoxLabelvar,padx=5)
outputBoxLabelvar.set("Output Box")
outputBoxLabel.grid(row=2,column=4,sticky=Tkinter.N+Tkinter.S+Tkinter.E+Tkinter.W)

#Input - desiredPlayerAdvantage Box
inputLittleBoxLabelvar = Tkinter.StringVar()
inputLittleBoxLabel = Tkinter.Label( inframe, textvariable=inputLittleBoxLabelvar,padx=5)
inputLittleBoxLabelvar.set("Player Advantage:")
inputLittleBoxLabel.grid(row=0,column=7,sticky=Tkinter.E)

inputLittleBoxvar = Tkinter.StringVar()
inputLittleBoxvar.set("0")
inputLittleBox = Tkinter.Entry(outframe,exportselection=0,textvariable=inputLittleBoxvar,width=5)
inputLittleBox.grid(row=0,column=2,sticky=Tkinter.W)

#Buttons
buttonParse = Tkinter.Button(inframe, text ="Sort Teams", command=parse_input,width=50,height=3,relief=Tkinter.GROOVE)
buttonParse.grid(row=1,column=1,padx=5,pady=5,sticky=Tkinter.N+Tkinter.S+Tkinter.E+Tkinter.W)

buttonHelp = Tkinter.Button(outframe, text ="Show Instructions", command=reset_values,width=50,height=3,relief=Tkinter.GROOVE)
buttonHelp.grid(row=1,column=4,padx=5,pady=5,sticky=Tkinter.N+Tkinter.S+Tkinter.E+Tkinter.W)

#Finish defining 
inputScroll.config(command=inputBox.yview)
outputScroll.config(command=outputBox.yview,bg='#000000',activebackground='#000000',troughcolor='#000000',highlightcolor='#000000')

root.iconbitmap('16x.ico')
root.mainloop()