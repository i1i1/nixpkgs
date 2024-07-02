{ lib
, fetchFromGitHub
, buildHomeAssistantComponent
, numpy
, paho-mqtt
, pillow
, py-mini-racer
, pybase64
, pycryptodome
, python-miio
, requests
, tzlocal
}:

buildHomeAssistantComponent rec {
  owner = "Tasshack";
  domain = "dreame_vacuum";
  version = "2.0.0b15";

  src = fetchFromGitHub {
    inherit owner;
    repo = "dreame-vacuum";
    rev = "refs/tags/v${version}";
    hash = "sha256-ydWirMQsO6DYU5UdygHRXCx8I3M7haYX9zPLela9H7E=";
  };

  propagatedBuildInputs = [
    numpy
    paho-mqtt
    pillow
    py-mini-racer
    pybase64
    pycryptodome
    python-miio
    requests
    tzlocal
  ];

  dontBuild = true;

  meta = with lib; {
    changelog = "https://github.com/Tasshack/dreame-vacuum/releases/tag/v${version}";
    description = "Dreame vacuum integration for Home Assistant";
    homepage = "https://github.com/Tasshack/dreame-vacuum";
    maintainers = with maintainers; [ i1i1 ];
    license = licenses.mit;
  };
}
