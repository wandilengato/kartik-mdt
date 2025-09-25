Config.Permissions = {
    ['sasp'] = {
        management_rank = 3, -- Minimum rank required to access management features
        backgroundImage = "pd.png", -- Background image used in the MDT (from web/images/)
        Pages = {
            -- Each page has `view` and `edit` fields defining access permissions.
            -- They can be set as:
            --    false                        → No access
            --    true                         → Full access (not recommended, use { rank = ... } instead)
            --    { rank = X }                 → Minimum rank required
            --    { tags = { "tag1" } }        → Required tags
            --    { rank = X, tags = { ... } } → Combined requirement
            --    + `require = "any"` (default) or "all" → Controls if both rank & tag are required

            dashboard = { view = { rank = 0 }, edit = { rank = 0 } }, -- Access to department dashboard
            citizens = { view = { rank = 0 }, edit = { rank = 0 } }, -- Access to citizen search/details
            reports = { view = { rank = 0 }, edit = { rank = 0 } }, -- Police report access
            roaster = { view = { rank = 0 }, edit = false }, -- Officer roster; viewable, not editable
            incidents = { view = { rank = 0 }, edit = { rank = 0 } }, -- Incident reports
            vehicles = { view = { rank = 0 }, edit = { rank = 0 } }, -- Vehicle search and edits
            criminalcode = { view = { rank = 0 }, edit = { rank = 0 } }, -- Criminal code definitions
            warrant = { view = { rank = 0 }, edit = { rank = 0 } }, -- Warrants module
            officermanagement = { view = { rank = 0 }, edit = { rank = 0 } }, -- Officer settings/profile
            securitycamera = { view = { rank = 0 }, edit = { rank = 0 } }, -- CCTV viewing
            dispatch = { view = { rank = 0 }, edit = { rank = 0 } }, -- Dispatch system access
            weapons = { view = { rank = 0 }, edit = { rank = 0 } }, -- Weapon license/status
            ftoreports = { view = { rank = 0 }, edit = { rank = 0 } }, -- FTO training reports
            courts = { view = { rank = 0 }, edit = false }, -- Court records; readonly
        }
    },

    ['bcso'] = {
        management_rank = 3,
        backgroundImage = "pd.png",
        Pages = {
            dashboard = { view = { rank = 0 }, edit = { rank = 0 } },
            citizens = { view = { rank = 0 }, edit = { rank = 0 } },
            reports = { view = { rank = 0 }, edit = { rank = 0 } },
            roaster = { view = { rank = 0 }, edit = false },
            incidents = { view = { rank = 0 }, edit = { rank = 0 } },
            vehicles = { view = { rank = 0 }, edit = { rank = 0 } },
            criminalcode = { view = { rank = 0 }, edit = { rank = 0 } },
            warrant = { view = { rank = 0 }, edit = { rank = 0 } },
            officermanagement = { view = { rank = 0 }, edit = { rank = 0 } },
            securitycamera = { view = { rank = 0 }, edit = { rank = 0 } },
            dispatch = { view = { rank = 0 }, edit = { rank = 0 } },
            bodycam = { view = { rank = 0 }, edit = false }, -- Readonly access to bodycam
            weapons = { view = { rank = 0 }, edit = { rank = 0 } },
            ftoreports = { view = { rank = 0 }, edit = { rank = 0 } },
            courts = { view = { rank = 0 }, edit = false },
        }
    },

    ['police'] = {
        management_rank = 3,
        backgroundImage = "pd.png",
        Pages = {
            dashboard = { view = { rank = 0 }, edit = { rank = 0 } },
            citizens = { view = { rank = 0 }, edit = { rank = 0 } },
            reports = { view = { rank = 0 }, edit = { rank = 0 } },
            roaster = { view = { rank = 0 }, edit = false },
            incidents = { view = { rank = 0 }, edit = { rank = 0 } },
            vehicles = { view = { rank = 0 }, edit = { rank = 0 } },
            criminalcode = { view = { rank = 0 }, edit = { rank = 0 } },
            warrant = { view = { rank = 0 }, edit = { rank = 0 } },
            officermanagement = { view = { rank = 0 }, edit = { rank = 0 } },
            securitycamera = { view = { rank = 0 }, edit = { rank = 0 } },
            bodycam = { view = { rank = 0 }, edit = false },
            dispatch = { view = { rank = 0 }, edit = { rank = 0 } },
            weapons = { view = { rank = 0 }, edit = { rank = 0 } },

            -- FTO reports: either rank-based or tag-based (e.g., tag = "FTO")
            ftoreports = {
                view = { rank = false, tags = { "FTO" }, require = "any" },
                edit = { rank = 0 }
            },

            courts = { view = { rank = 0 }, edit = { rank = 0 } },
            sop = { view = { rank = 0 }, edit = { rank = 0 } }, -- SOP documents
        }
    },

    ['ambulance'] = {
        management_rank = 2,
        backgroundImage = "ems.png",
        Pages = {
            dashboardems = { view = { rank = 0 }, edit = { rank = 0 } },
            citizensems = { view = { rank = 0 }, edit = false },
            emsreports = { view = { rank = 0 }, edit = { rank = 0 } },
            roaster = { view = { rank = 0 }, edit = false },
            emsincidents = { view = { rank = 0 }, edit = { rank = 0 } },
            medicmanagement = { view = { rank = 0 }, edit = { rank = 0 } },
            dispatch = { view = { rank = 0 }, edit = { rank = 0 } },
            emsftoreports = { view = { rank = 0 }, edit = { rank = 0 } },
            courts = { view = { rank = 0 }, edit = false },
        }
    },

    ['lawyer'] = {
        management_rank = 0, -- No management functionality
        backgroundImage = "doj.png",
        Pages = {
            citizens = { view = { rank = 0 }, edit = false },
            reports = { view = { rank = 0 }, edit = false },
            vehicles = { view = { rank = 0 }, edit = false },
            criminalcode = { view = { rank = 0 }, edit = { rank = 0 } },
            warrant = { view = { rank = 0 }, edit = false },
            courts = { view = { rank = 0 }, edit = false },
        }
    }
}