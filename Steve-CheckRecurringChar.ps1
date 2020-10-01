# Script Parameters
param ([string]$foo)

######################################
##  This will try to get the first recurring
##  char in the input string if there is any
##
##  It uses array to indicate if a char appears in the 
##  input string. When a char's array element is non zero,
##  it means it does not exist. When it is 0, 
##  it means the char appears in the input string.
######################################


# Check the foo's length. If 0, exit.
if ($foo.Length -eq 0)
{
  exit
}


# Create and initialize an array, with the total to be the number of chars in ASCII table
# The values are from 1 to 128. None are 0 initially.
$array = 1..128

# Put the first char into the array, set its element to 0
$ascii = [int][char]$foo.Substring(0,1)+1
$array[$ascii]=0 

# Loop through $foo (from 2nd)
for ($i = 1; $i -lt $foo.Length; $i++) 
{
  # Get the current char's ASCII value
  $ascii = [int][char]$foo.Substring($i,1)+1

  # Check its array element value is 0 or not
  if ($array[$ascii] -eq 0)
  {
    Write-Output $foo.Substring($i,1)
    exit
  }

  # Set the char's array element to be 0
  $array[$ascii]=0 
}

