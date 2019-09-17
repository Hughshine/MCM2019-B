from math import sin, atan
from math import sinh
from math import sqrt
from math import pi
from math import atanh
import numpy as np
import matplotlib.pyplot as plt

# plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签

'''
水平方向减速不能忽略
# '''


g = 9.8
h = 0.6
m = 0.27

def hit_again(v, theta1):
    print('v=', v)
    vh = v * sin(theta1 * pi / 180)
    print('vh=', vh)
    dt = 0.0167
    dx = vh * dt
    print('dx=', dx)

    vv1 = v * sin((90 - theta1) * pi / 180)

    u = 0.02
    N = 100 * (v / 3)  # 碰撞最深处压力大约为100N TODO?
    f = u * N
    print('f=', f)

    # vh2 = vh
    vh2 = (vh * m - f * dx) / m

    print('vh2=', vh2)

    print(vh2 / vh)

    '''
    竖直方向减速
    '''
    vv2 = 0.83 * v * sin((90 - theta1) * pi / 180)  # 0.83 为估计的恢复系数

    vv2 = 3
    print('vv2=', vv2)

    # theta1 = atan(vh / vv1) * 180 / pi
    theta2 = atan(vh2 / vv2) * 180 / pi

    print('theta1=', theta1)
    print('theta2=', theta2)

    v2 = sqrt(vv2 ** 2 + vh2 ** 2)
    print('v2=', v2)
    print('-------------------------------------')

    return vv2, theta2


if __name__ == '__main__':
    '''
    不断撞击，角度测试
    '''
    vv = 3
    theta = 1

    vv_lst = list()
    theta_lst = list()

    for i in range(10):
        # vv = 3
        vv, theta = hit_again(vv, theta)
        vv_lst.append(vv)
        theta_lst.append(theta)

    plt.plot(range(10), vv_lst)
    plt.title('speed changes with hit times')
    plt.ylabel('speed(m/s)')
    plt.xlabel('hit times')
    plt.show()

    plt.plot(range(10), theta_lst)
    plt.title('angle changes with hit times(speed unchanged)')
    plt.ylabel('angle(°)')
    plt.xlabel('hit times')
    plt.show()

    '''
    做第四题，找theta
    '''
    # h = 0.6
    # vv = sqrt(2*g*h)
    #
    # for a1 in np.arange(0.01, 1, 0.001):
    #     vv = sqrt(2*g*h)
    #     v2, a2 = hit_again(vv, a1)
    #     if abs(a1 + a2 - 1)< 1e-3:
    #         print(a1, a2)
    #         break


