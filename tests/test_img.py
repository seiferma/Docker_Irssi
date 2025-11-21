from testcontainers.core.container import DockerContainer
from testcontainers.core.wait_strategies import HttpWaitStrategy, HealthcheckWaitStrategy
import requests

checkip_url = 'http://checkip.amazonaws.com'

def test_healthcheck(img_name):
    with DockerContainer(img_name).with_kwargs(cap_add=['NET_ADMIN', 'NET_RAW'], tty=True, init=True).with_exposed_ports(8080).waiting_for(HttpWaitStrategy(8080)) as subject:
            
        result = requests.get(f"http://{subject.get_container_host_ip()}:{subject.get_exposed_port(8080)}")
        assert result.status_code == 200
