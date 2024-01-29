resource "tfe_project" "project" {
  organization = "havananet"
  name = "tfeproject"
}

resource "tfe_team" "aide_ro" {
  name         = "havananet-read"
  organization = "havananet"
  visibility   = "organization"
  organization_access {
    read_workspaces         = false
    read_projects           = false
    manage_policies         = false
    manage_policy_overrides = false
    manage_workspaces       = false
    manage_providers        = false
    manage_modules          = false
    manage_run_tasks        = false
    manage_projects         = false
    manage_membership       = false
  }
}

resource "tfe_team_project_access" "aide_ro" {
  access     = "custom"
  team_id    = tfe_team.aide_ro.id
  project_id = tfe_project.project.id
  project_access {
    settings = "read"
    teams    = "read"
  }
  workspace_access {
    create         = false
    delete         = false
    locking        = false
    move           = false
    run_tasks      = false
    runs           = "read"
    sentinel_mocks = "read"
    state_versions = "read"
    variables      = "read"
  }
}

resource "tfe_team" "aide_contributor" {
  name         = "havananet-contributor"
  organization = "havananet"
  visibility   = "organization"
  organization_access {
    read_workspaces         = false
    read_projects           = false
    manage_policies         = false
    manage_policy_overrides = false
    manage_workspaces       = false
    manage_providers        = false
    manage_modules          = false
    manage_run_tasks        = false
    manage_projects         = false
    manage_membership       = false
  }
}

resource "tfe_team_project_access" "aide_contributor" {
  access     = "custom"
  team_id    = tfe_team.aide_contributor.id
  project_id = tfe_project.project.id
  project_access {
    settings = "read"
    teams    = "read"
  }
  workspace_access {
    create         = true
    delete         = false
    locking        = true
    move           = false
    run_tasks      = true
    runs           = "apply"
    sentinel_mocks = "read"
    state_versions = "write"
    variables      = "write"
  }
}

resource "tfe_team" "aide_admin" {
  name         = "havananet-admin"
  organization = "havananet"
  visibility   = "organization"
  organization_access {
    read_workspaces         = false
    read_projects           = false
    manage_policies         = false
    manage_policy_overrides = false
    manage_workspaces       = false
    manage_providers        = false
    manage_modules          = false
    manage_run_tasks        = false
    manage_projects         = false
    manage_membership       = false
  }
}

resource "tfe_team_project_access" "aide_admin" {
  access     = "custom"
  team_id    = tfe_team.aide_admin.id
  project_id = tfe_project.project.id
  project_access {
    settings = "delete"
    teams    = "manage"
  }
  workspace_access {
    create         = true
    delete         = true
    locking        = true
    move           = false
    run_tasks      = true
    runs           = "apply"
    sentinel_mocks = "read"
    state_versions = "write"
    variables      = "write"
  }
}