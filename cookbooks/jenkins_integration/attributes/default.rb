#
# Core Integration Code
#
default[:jenkins_integration][:git][:name]      = 'Jenkins Integration'
default[:jenkins_integration][:git][:email]     = 'jenkins@example.org'

default[:jenkins_integration][:security]        = 'local_users'
default[:jenkins_integration][:deploy_key]      = nil           # Set this in cluster

node.default[:jenkins][:server][:plugins] += %w[ parameterized-trigger ansicolor ]

# 
# Cookbook CI
# 
default[:jenkins_integration][:cookbook_ci][:test_homebase] = 'git@github.com:infochimps-labs/ironfan-homebase.git'
default[:jenkins_integration][:cookbook_ci][:chef_user]  = 'test'
default[:jenkins_integration][:cookbook_ci][:targets]    = [ 'testharness-simple' ]
default[:jenkins_integration][:cookbook_ci][:broken]     = nil   # Set to launch a known-broken facet
default[:jenkins_integration][:cookbook_ci][:branch]     = 'master'
default[:jenkins_integration][:cookbook_ci][:schedule]   = '@midnight'
default[:jenkins_integration][:cookbook_ci][:max_wait]   = 60*20 # 20 minutes

koans = Mash.new()
koans[:testing] = "Newest divergences ready to converge."
koans[:staging] = "Everything has converged once more. Strut and fret your hour upon this new stage."
default[:jenkins_integration][:cookbook_ci][:koan] = koans

pantries        = %w[ git@github.com:infochimps-labs/ironfan-pantry.git ]
homebases       = %w[ git@github.com:infochimps-labs/ironfan-homebase.git ]
default[:jenkins_integration][:cookbook_ci][:pantries]   = pantries
default[:jenkins_integration][:cookbook_ci][:homebases]  = homebases
