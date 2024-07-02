{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,
  setuptools,
  pytestCheckHook,
  untokenize,
}:

buildPythonPackage rec {
  pname = "py-mini-racer";
  version = "0.6.0";
  src = fetchFromGitHub {
    owner = "sqreen";
    repo = "PyMiniRacer";
    rev = "refs/tags/v${version}";
    hash = "sha256-r6ghH1uPbnM4cruxgcOkHv3HsC29p3fILtH3Mzpy8yQ=";
  };
  doCheck = false;

  pythonImportsCheck = [ "py_mini_racer" ];

  meta = {
    description = "Minimal, modern embedded V8 for Python";
    homepage = "https://github.com/sqreen/PyMiniRacer";
    changelog = "https://github.com/sqreen/PyMiniRacer/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.isc;
    maintainers = with lib.maintainers; [ i1i1 ];
  };
}
