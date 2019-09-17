# print(-0.2124,  0.297 * 2 * -0.2124 + 2.118 - 1, 0.297 ** 2 * -0.2124 + 2.118 * 0.297 + 0.0433 + 0.297)
from math import pi
import math
# print((1/3 * (0.2) ** 3 - 1/3 * 0.1 ** 3 * 0.22) * 2 * pi * 0.658)

g = 9.8
md = 3.6
mb = 0.27
R = 0.2
e = 0.834
heightd = 0.22

def calc_T_vd1_vd2_by_h(h):
    v = (2 * g * h)**0.5
    T = 2 * v / g

    vd1 = (0.166 * v + 0.4455) / 1.834
    vd2 = calc_vd2(vd1)
    return T, vd1, vd2


def calc_vd2(vd1):  # 根据恢复系数
    vd2 = vd1 - 0.4455
    return vd2


def calc_vd1(vd2):
    vd1 = vd2 + 0.4455
    return vd1


def calc_t1(vd2, hd):
    t1 = (vd2 + (vd2**2 + 2*g*hd)**0.5)/g
    return t1


def calc_F_t3(vd1, hd):
    F = 1/2*md*(vd1**2)/hd + md*g
    ad = (F-md*g)/md
    t3 = vd1 / ad
    return F, t3


def calc_params_by_h_hd(h, hd, L, n, mind):
    T, vd1, vd2 = calc_T_vd1_vd2_by_h(h)
    # vd1 = calc_vd1(vd2)
    t1 = calc_t1(vd2, hd)
    F, t3 = calc_F_t3(vd1, hd)

    # s, theta = calc_shortest_s_theta(L, n, mind)
    theta = 76.74 * pi / 180
    # theta = (90 - 3.709965892066852) * pi / 180
    # print('theta:', theta)
    # calc_Fp_by_theta(F, 8, theta)
    calc_drum_hand_dist(L, theta)
    Fp = calc_Fp_by_theta(F, n, theta)

    print('-----------------')
    print('vd1(碰撞前鼓速度):', vd1)
    print('vd2(碰撞后鼓速度):', vd2)
    print('T:(周期时长)', T)
    print('t1(自由下落时间):', t1)
    print('t2(停止时间):', T-t1-t3)
    print('t3(加速时间):', t3)
    print('F:', F)
    print('-----------------')


def calc_shortest_s_theta(L, n, mind):
    s = mind/2/math.sin(pi/n) - R
    print("%d个人、人间距最短为%fm时，人与鼓沿最短距离为%fm" %(n, mind, s))

    theta = math.asin(s / L)
    print("此时发力角度theta = %f度" %(theta *180 / pi))
    # print("手距离鼓下平面高度为%f米" %(calc_drum_hand_dist(L, theta)))
    return s, theta


def calc_drum_hand_dist(L, theta):  # 弧度制
    h = L * math.cos(theta) + heightd/2
    print('%f长度的绳子，与竖直方向呈%f的角度时，鼓底与手的距离为%f米' %(L, theta*180/pi, h))
    return h


def calc_Fp_by_theta(F, n, theta):  # 弧度制
    Fp = F / n / math.cos(theta)
    print('Fp:%f(N)'%Fp)
    return Fp


def calc_E(E1, E2, u1, u2):
    E = 1/((1-u1**2)/E1 + (1-u2**2)/E2)
    print('E:', E)
    return E


def calc_N(E):  # TODO:计算接触状态的平均压力：动量角度 与 接触力学角度
    # E = calc_E()
    d = 0.005
    F = 4/3 * E * R **0.5 * d**1.5
    print('最大的力：', F, 'N')
    pass


if __name__ == '__main__':
    print('假设两弹性体的弹性模量大约在1e6Pa的量级，泊松比为0.4')
    E = calc_E(1e6, 1e6, 0.4, 0.4)
    calc_N(E)
    # h = 0.625
    # h = 0.60
    h = 0.45
    hd = 0.10
    L = 2
    n = 10
    mind = 0.6
    calc_params_by_h_hd(h, hd, L, n, mind)
    # calc_shortest_s_theta(1.7, 8, 0.6)

    # for theta in range(50, 90):
    # theta = 76.74
    # calc_drum_hand_dist(L, theta * pi / 180)









