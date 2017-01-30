tion program

up vote
0
down vote
favorite
I have 2 interfaces: login and register.

I have an error in saving the username and password data into a text file.

And i have a problem in reading back the data to proceed with the authentication.

This my code:

import Tkinter 
WindowBox = Tkinter.Tk()
WindowBox.geometry("250x200")
WindowBox.title("Welcome to E-UPSR")

getusername = Tkinter.StringVar()
getpassword = Tkinter.StringVar()

LabelName = Tkinter.Label (WindowBox, text="Username:")
LabelName.pack()
TxtBoxName = Tkinter.Entry (WindowBox, textvariable= getusername)
TxtBoxName.pack()

LabelName = Tkinter.Label (WindowBox, text="Password:")
LabelName.pack()
TxtBoxName = Tkinter.Entry (WindowBox, textvariable= getpassword)
TxtBoxName.pack()

tudent=[]

def read():
    addstudent = open ("student.txt", "w")
    addstudent.write("User ID: " + entry_box1.get())
    addstudent.write("\nUser Password: " + entry_box2.get())
    addstudent.close ()

def back():
    RegBox.withdraw()
    WindowBox.deiconify()
    return    

def register():
    WindowBox.withdraw()
    RegBox.deiconify()
    return

RegBox = Tkinter.Tk()
RegBox.geometry("250x200")
RegBox.title("register")

LabelName = Tkinter.Label (RegBox, text="Enter Username:")
LabelName.pack()
TxtBoxName = Tkinter.Entry (RegBox, textvariable= getusername)
TxtBoxName.pack()

LabelName = Tkinter.Label (RegBox, text="Enter Password:")
LabelName.pack()
TxtBoxName = Tkinter.Entry (RegBox, textvariable= getpassword)
TxtBoxName.pack()
RegBox.withdraw()

def save():
    getusername=entry_box1.get()
    getpassword=entry_box2.get()
    addstudent = open ("student.txt", "w")
    addstudent.write("Username:" + entry_box1.get())
    addstudent.write("Password: " + entry_box2.get())
    addstudent.close ()

BtnName = Tkinter.Button (RegBox, text="Back", command=back).pack()   
BtnName = Tkinter.Button (RegBox, text="Enter", command=save).pack()
BtnName = Tkinter.Button (WindowBox, text="Register", command=register).pack()
BtnName = Tkinter.Button (WindowBox, text="Proceed", command=read).pack()

WindowBox.mainloop()