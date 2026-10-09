
import math

class Complex:
    def __init__(self, real, imag):
        self.re = float(real)
        self.im = float(imag)

    def __str__(self):
        return '{0} + {1}i'.format(self.re, self.im)

    def __neg__(self):
        return Complex(-1.0 * self.re, -1.0 * self.im)

    def __abs__(self):
        return math.hypot(self.re, self.im)

    def __add__(self, other):
        return Complex(self.re + other.re, self.im + other.im)

    def __iadd__(self, other):
        return self + other

    def __sub__(self, other):
        return Complex(self.re - other.re, self.im - other.im)

    def __isub__(self, other):
        return self - other

    def __mul__(self, other):
        return Complex(self.re * other.re - self.im * other.im, 
                       self.im * other.re + self.re * other.im)

    def __mul__(self, scalar):
        return Complex(self.re * scalar,  self.im * scalar)

    def __rmul__(self, scalar):
        return self * scalar

    def __imul__(self, other):
        if isinstance(other, Complex):
            return Complex(self.re * other.re - self.im * other.im, 
                       self.im * other.re + self.re * other.im)
        else:
            return Complex(self.re * scalar,  self.im * scalar)

    def __truediv__(self, other):
        return Complex((self.re * other.re + self.im * other.im) / math.hypot(other.re, other.im), 
                       (self.im * other.re - self.re * other.im) / math.hypot(other.re, other.im))

    def __eq__(self, other):
        return ((self.re == other.re) and (self.im == other.im))
