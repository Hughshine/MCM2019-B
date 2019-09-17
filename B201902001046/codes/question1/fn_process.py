from math import sqrt
'''
40cm -> 2.954 m/s -> ratio: 1/1.13
60cm -> 3.84 m/s -> ratio: 1/1.2 
80cm -> 4.267 m/s -> ratio: 1.27
合理考虑，弹力越大，形变越大，能量损失越大
【速度误差？算在测量误差里吧。】
'''

gap = 1/960
h = 0.1
m = 0.27


def delta_e(v1, v2):
    print('下降速度：', v1)
    print('上升速度：', v2)
    e1 = m * v1 ** 2 / 2
    e2 = m * v2 ** 2 / 2
    print('能量比：', v1 / v2)
    print('吸收效率：', v2 / v1)
    return m * (v1**2 - v2**2)/2


'''
40
'''
t_40_down = 32.5 * gap
v_40_down = h / t_40_down

t_40_up = 37 * gap
v_40_up = h / t_40_up
print('-----------------------分界线-------------------------')
print('下落高度：40cm')
print('下落平均帧数：32.5')
print('下落平均时间：', t_40_down)
print('上升平均帧数：37')
print('下落平均时间：', t_40_up)

e40 = delta_e(v_40_down, v_40_up)
print('e40:', e40)

v = sqrt(2 * 9.8 * 0.35)
print('理论下行速度：', v)


'''
60
'''
t_60_down = 25 * gap
v_60_down = h / t_60_down

t_60_up = 30 * gap
v_60_up = h / t_60_up
print('-----------------------分界线-------------------------')

print('下落高度：60cm')
print('下落平均帧数：25')
print('下落平均时间：', t_60_down)
print('上升平均帧数：30')
print('下落平均时间：', t_60_up)

e60 = delta_e(v_60_down, v_60_up)
print('e60:', e60)

v = sqrt(2 * 9.8 * 0.55)  # 因为测量下行速度为最后10cm的平均速度，因而去掉最后5cm
print('理论下行速度：', v)

'''
80
'''
t_80_down = 22.5 * gap
v_80_down = h / t_80_down

t_80_up = 28.5 * gap
v_80_up = h / t_80_up
print('-----------------------分界线-------------------------')

print('下落高度：80cm')
print('下落平均帧数：22.5')
print('下落平均时间：', t_80_down)
print('上升平均帧数：28.5')
print('下落平均时间：', t_80_up)

e80 = delta_e(v_80_down, v_80_up)
print('e80:', e80)

v = sqrt(2 * 9.8 * 0.75)
print('理论下行速度：', v)


