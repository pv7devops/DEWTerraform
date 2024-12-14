# # for i in range(9):
# #     for j in range(3):
# #         print(" * "*3, end="") 
# #         print("|", end = "")
# #     print("")
# #     if i == 2 or i == 5:
# #         print("-"*31)

# # while True:
# #     x = input("Do you want to continue? ")
# #     if x.lower() == "y":
# #         star = "*"
# #         print(star)
# #     else:
# #         break
    
# row1 = ["*","*","*","*","*","*","*","*","*"]
# row2 = ["*","*","*","*","*","*","*","*","*"]
# row3 = ["*","*","*","*","*","*","*","*","*"]
# row4 = ["*","*","*","*","*","*","*","*","*"]
# row5 = ["*","*","*","*","*","*","*","*","*"]
# row6 = ["*","*","*","*","*","*","*","*","*"]
# row7 = ["*","*","*","*","*","*","*","*","*"]
# row8 = ["*","*","*","*","*","*","*","*","*"]
# row9 = ["*","*","*","*","*","*","*","*","*"]

# finalmatrix = [row1, row2, row3, row4, row5, row6, row7, row8, row9]
# def printoutput():
#     for z in range(3):
#         print(" {} ".format(row1[z]), end = "")  
#     print("|", end = "") 
#     for z in range(3, 6):
#         print(" {} ".format(row1[z]), end = "") 
#     print("|", end = " ") 
#     for z in range(6,9):
#         print(" {} ".format(row1[z]), end = "") 
#     print()
    
        
# # printoutput()
# row1[1]=9
# # printoutput()
# # print(finalmatrix)
# while True:
#     x = input("Do you want to continue? ")
#     if x.lower() == "y":
#         for index, row in enumerate(finalmatrix):
#             if index == 3 or index == 6:
#                 print("-"*30) 
#             for i, v in enumerate(row):
#                 if i == 3 or i == 6:
#                     print("|", end = "")
#                 print(" {} ".format(v), end = "")
#             print()
#     else:
#         break

li1 = ["Tom", "Harry"]

# for i in range(len(li1)):
#     print(li1[i])
    
# x = [i for i in li1]
# print(x)

for index, value in enumerate(li1):
    print(index,"=>",value)