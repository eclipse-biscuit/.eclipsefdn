local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.biscuit', 'eclipse-biscuit') {
  settings+: {
    description: "",
    name: "Eclipse Biscuit",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('biscuit') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "delegated, decentralized, capabilities based authorization token",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://hooks.slack.com/services/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') {
          content_type: "json",
          events+: [
            "*"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('dev') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('biscuit-actix-middleware') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 0,
        },
      ],
    },
    orgs.newRepo('biscuit-cli') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "CLI to generate and inspect biscuit tokens",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('biscuit-component-wasm') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "NPM package distributing biscuit in WebAssembly for web components",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('biscuit-go') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "any:lint",
            "any:test"
          ],
          requires_linear_history: true,
        },
      ],
    },
    orgs.newRepo('biscuit-haskell') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('biscuit-java') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Java implementation of the Biscuit authentication and authorization token",
      homepage: "https://biscuitsec.org/",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "authorization"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('OSSRH_GPG_SECRET_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_GPG_SECRET_KEY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_USERNAME') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('biscuit-lsp') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_wiki: false,
      template_repository: "IWANABETHATGUY/tower-lsp-boilerplate",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('biscuit-python') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('NETLIFY_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('PYPI_API_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('biscuit-rust') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Rust implementation of the Biscuit authorization token",
      homepage: "https://www.biscuitsec.org",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "authentication",
        "authorization",
        "token"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
        orgs.newRepoWebhook('https://hooks.slack.com/services/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') {
          events+: [
            "*"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CODSPEED_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('biscuit-swift') {
    },
    orgs.newRepo('biscuit-wasm') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "WebAssembly wrapper for Biscuit authorization tokens",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('biscuit-web-components') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "web components for Biscuit based Datalog editors and policy execution",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('biscuit-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Biscuit project website",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('tree-sitter-biscuit') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Tree Sitter grammar for biscuit datalog",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('vscode-biscuit') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "website for Biscuit tokens",
      homepage: "https://www.biscuitsec.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('CELLAR_DOCS_BUCKET') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('deploy') {
          branch_policies+: [
            "main",
            "netlify"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
