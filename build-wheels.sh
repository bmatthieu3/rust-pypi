#!/bin/bash
set -ex

curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y
export PATH="$HOME/.cargo/bin:$PATH"

cd /io

for PYBIN in /opt/python/{cp27-cp27m,cp27-cp27mu,cp35-cp35m,cp36-cp36m,cp37-cp37m}/bin; do
    export PYTHON_SYS_EXECUTABLE="$PYBIN/python"

    # Pin wheel==0.31.1 to work around issue
    # https://github.com/pypa/auditwheel/issues/102
    "${PYBIN}/pip" install wheel==0.31.1
    "${PYBIN}/pip" install -U setuptools setuptools-rust
    "${PYBIN}/python" setup.py bdist_wheel
done

for whl in dist/*.whl; do
    auditwheel repair "$whl" -w dist/
    rm -rf "$whl"
done