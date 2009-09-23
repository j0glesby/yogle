set :user, 'j0glesby'  # Your dreamhost account's username
set :domain, 'www.youdel.com'  # Dreamhost servername where your account is located 
set :project, 'yogle'  # Your application as its called in the repository
set :application, 'yogle.yoglesoft.com'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/j0glesby/yoglesoft.com"  # The standard Dreamhost setup

set :scm, 'git'
set :repository,  "git@github.com:j0glesby/yogle.git"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

set :scm_command, "~/packages/bin/git" #updated version of git on  server in user directory

set :local_scm_command, "/Users/charioglesby/bin/git" #correct path to local  git 
