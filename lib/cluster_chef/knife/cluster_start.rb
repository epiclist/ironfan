#
# Author:: Philip (flip) Kromer (<flip@infochimps.com>)
# Copyright:: Copyright (c) 2011 Infochimps, Inc
# License:: Apache License, Version 2.0
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

require File.expand_path(File.dirname(__FILE__)+"/knife_common.rb")

class Chef
  class Knife
    class ClusterStart < Knife
      include ClusterChef::KnifeCommon

      deps do
        ClusterChef::KnifeCommon.load_deps
      end

      banner "knife cluster start CLUSTER_NAME FACET_NAME (options)"
      option :dry_run,
        :long => "--dry-run",
        :description => "Don't really run, just use mock calls"

      def run
        load_cluster_chef
        die(banner) if @name_args.empty?
        enable_dry_run if config[:dry_run]

        target = server_group(* @name_args)
        target.start
        target.display
      end
    end
  end
end
