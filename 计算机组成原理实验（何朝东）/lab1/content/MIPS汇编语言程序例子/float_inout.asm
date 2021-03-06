#********************************************
#         浮点数输入与输出
#********************************************
.text                           # 代码段
.globl main                     # globl指明程序的入口地址 main
main:                           # 入口地址 main
    la $a0, str1                  # 取字符串地址 
    li $v0, 4                     # 4号 功能调用，输出字符串 
    syscall                       # 系统调用

    li $v0,6                      # 6号 功能调用，输入一个浮点数，然后保存在f0寄存器（在PCSpim模拟器中是FP0）中
    syscall                       # 系统调用

    la $a0, str2                  # 取字符串地址 
    li $v0, 4                     # 4号 功能调用，输出字符串 
    syscall                       # 系统调用

    mov.s $f12,$f0                # 将键盘输入的浮点数（f0）传送给输出寄存器（f12）(单精度传送)
                                # 说明：在PCSpim模拟器中，浮点数寄存器是FP0-FP31，而在MIPS指令中表示为f0-f31
    li $v0,2                      # 2号 功能调用，输出浮点数，数据必须放在f12寄存器中
    syscall                       # 系统调用
  
.data                           # 数据段
   str1:                             # 变量名称
     .asciiz "Input float data: "    # 字符串定义，.asciiz类型定义字符串，最后以"00"字符作为终止符结束
   str2:                             # 变量名称
     .asciiz "\nOutput float data: " # 字符串定义
