import pytest
from ..double import square, triple

def test_square():
    assert(square(17) == 17 * 2)

def test_triple():
    assert(triple(17) == 17 * 3)