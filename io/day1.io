######### Question #1
# Evaluate 1 + 1
1 + 1 println

# Throws Exception
e := try(
	1 + "one" println
)


e catch(Exception,
    writeln("Exception caught.")
) 

# Io is strongly typed since it will not implicitly convert values
# but rather throw an exception 

######## Question #2
# 0 evaluates to true.
# Empty string evaluates to  true
# nil evaluates to false
# All below evaluate true
"True and true: " println
(true and true) println

"True or false: " println
(true or false) println

"0 or false: " println
(0 or false) println 

"\"\" or false: " println
("" or false) println

# since 0/"" or false evaluates to true, 0 musty have a truthy value

# evaluates to falss
"Nil and True: " println
(nil and true) println

# All values that are not nil and false evaluate to true, including empty string and 0

######## Question #3
# You can tell what slots a protoype supports by using the proto keyword:
myObj := Object clone
myObj slot := "this is my slot"
myObjClone := myObj clone
myObjClone proto println

########## Question #4
# =, := and ::= are for assignment 
# = is used if a slot already exists. Trying to use = without a preexisting slot will throw an expceiton
# := is used when a slot needs to be created in addition to assigning value
# ::= does the same as := but also creates a setter 


######## Excercise #1
# this file is executable so done. wooo!

######## Excercise #2
Food := Object clone
Food taste := method("salty" println)
Food taste
