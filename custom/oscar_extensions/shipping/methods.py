from decimal import Decimal as D
from oscar.apps.shipping import methods
from oscar.core import prices

class Standard(methods.Base):
    code = 'standard'
    name = 'Standard shipping'
    charge_excl_tax = D('5.00')

class Express(methods.Base):
    code = 'express'
    name = 'Express shipping'
    charge_excl_tax = D('10.00')
