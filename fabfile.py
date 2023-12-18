from fabric.api import env, local, put, run

env.user = 'ubuntu'
env.hosts = ['54.173.187.6', '100.25.215.210']

def do_pack():
        folder = "/root/AirBnB_clone_v2/web_static"
        archive = "/root/AirBnB_clone_v2/web_static/versions/web_static_.tgz"

        local(f"tar czf {archive} -C {folder} .")

        put(archive, '/tmp/')
        run("tar -xzvf /tmp/web_static_.tgz -C /data/web_static/releases")
        run("ln -s /data/web_static/releases/* /data/web_static/current")
