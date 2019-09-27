import os
import shutil
import xml.etree.ElementTree as ET
import subprocess
import matplotlib.pyplot as plt

optimizer_path 	= '/home/tmp/Documents/Tesztek/mate_fork/optimizer/optimizer/optimizer.py'
curr_dir  		= os.getcwd()						# base directory
orig_name 		= 'hh_pas_surrogate'						# name of the working directory we want to copy
orig_dir  		= curr_dir + '/' + orig_name		# path of this directory
num_runs  		= 10							# how many copies we want
parallel_runs   = 5									# how many optimizations we allow to run in parallel

# define basic things for the xml files
rnd_start  = 1234							# random seed in the first run
num_iter   = 100				# number of iterations
num_repet  = 1				# population size
csv_name   = 'input_data3.dat'				# the csv we want to use
#sim_script = 'teststeps_optim5.py'			# the script for the external simulator
num_param  = 3			 					# number of parameters to optimize (needed as a command line argument)


def MakeCopies():
	for i in range(1, num_runs+1):
		new_dir = orig_dir + '_' + str(i)
	
		if not os.path.exists(new_dir):
			shutil.copytree(orig_dir, new_dir)

def EditXMLs():
	for i in range(1,num_runs+1):
		subdir   = orig_dir + '_' + str(i)
		xml_name = subdir + '/' + '_settings.xml'

		if os.path.exists(subdir):
		 	tree = ET.parse(xml_name)
		 	root = tree.getroot()
		 	
		 	root.find('num_iter').text 	= str(float(num_iter))
		 	root.find('seed').text 				= str(float(rnd_start + i))
		 	#root.find('sim_command').text 		= 'python ' + subdir + '/' + sim_script + ' ' + str(int(num_param))
		 	root.find('input_dir').text 		= subdir + '/' + csv_name
		 	root.find('base_dir').text 			= subdir
		 	root.find('num_repet').text			= str(float(num_repet))

		 	tree.write(xml_name)

		else:
			print subdir + "doesn't exist"


## generate bash script
## we could do this in one step without the commands list but I it like this way

def GenerateCommands():
	# create a list containing the commands we want to run
	commands = []
	for i in range(1, num_runs+1):
		subdir   = orig_dir + '_' + str(i)
		xml_name = subdir + '/' + '_settings.xml'

		command = 'python ' + optimizer_path + ' -c ' + xml_name #+ ' -v_level=1'
		
		if i % parallel_runs > 0:
			command += ' &'
		command += '\n'

		commands.append(command)

	commands.append('wait')		# does not work without this. I don't exactly understand why

	return commands

def CreateBashScript():
	# write the commands into a file
	commands = GenerateCommands()
	with open('run_simulations.sh', 'w') as bash_script:
		for line in commands:
			bash_script.write(line)

def RunOptim():
	# run the bash script
	bash_script_name = curr_dir + '/run_simulations.sh'
	subprocess.call(['sh', bash_script_name])


def main():
	MakeCopies()
	EditXMLs()
	CreateBashScript()
	RunOptim()


if __name__ == '__main__':
	main()