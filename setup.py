from setuptools import setup
from setuptools_rust import Binding, RustExtension

setup(
    name="rust_pypi",
    version="1.8.0",
    rust_extensions=[RustExtension("rust_pypi.rust_pypi", 'Cargo.toml', binding=Binding.NoBinding)],
    packages=["rust_pypi"],
    install_requires=[
        # CFFI is used for loading the dynamic lib compiled with cargo
        'cffi',
    ],
    # rust extensions are not zip safe, just like C-extensions.
    zip_safe=False,
)
