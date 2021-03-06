#
# Cookbook Name:: docker_test
# Recipe:: image_lwrp
#
# Copyright 2013, Brian Flad
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

docker_image "base"
docker_image "busybox"

docker_image "base" do
  action :remove
end

fname = "/tmp/docker_image_build.dockerfile"

cookbook_file fname do
  source "Dockerfile"
end

docker_image "myImage" do
  tag "myTag"
  dockerfile fname
  action :build
end

docker_image "myImage" do
  action :remove
end
