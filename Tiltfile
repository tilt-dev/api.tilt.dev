load('ext://uibutton', 'cmd_button', 'location', 'text_input')

local_resource(
  'base',
  cmd='make base',
  deps=['Makefile', './.git/modules/base/HEAD']
)

local_resource(
  name='gendocs',
  cmd='make gendocs',
  deps=['Makefile', 'go.mod', 'go.sum', './cmd/gendocs', './config', './openapi-spec'])

docker_build(
  'api-site-base',
  '.',
  dockerfile='deploy/base.dockerfile',
  only=['./base/src/Gemfile', './base/src/Gemfile.lock'])

docker_build(
  'api-site',
  '.',
  live_update=[
    sync('config', '/config'),
    sync('docs', '/docs'),
  ],
  dockerfile='deploy/Dockerfile')

k8s_yaml('deploy/serve.yaml')
k8s_resource(
  'api-site',
  port_forwards=['4004:4000'],
  resource_deps=['base'],
)


cmd_button(name='update-base',
           resource='base',
           argv=['make', 'update-base'],
           text='Git pull latest',
           icon_name='merge')

cmd_button(name='dump-api',
           resource='gendocs',
           argv=['make', 'dump-api'],
           text='Dump API specs',
           icon_name='cloud_download')
