local_resource(
  name='gendocs',
  cmd='make gendocs',
  deps=['Makefile', './config'])

docker_build(
  'api-site-base',
  '.',
  dockerfile='deploy/base.dockerfile',
  only=['./base/src/Gemfile', './base/src/Gemfile.lock'])

docker_build(
  'api-site',
  '.',
  live_update=[
    sync('docs', '/docs'),
  ],
  dockerfile='deploy/Dockerfile')

k8s_yaml('deploy/serve.yaml')
k8s_resource(
  'api-site', port_forwards=['4004:4000'])
