Class Gist {
    [Int]$Comments
    [Uri]$CommentsUrl
    [Uri]$CommitsUrl
    [DateTime]$CreatedAt
    [string]$Description
    [GistFile[]]$Files
    [GistFork[]]$Forks
    [Uri]$ForksUrl
    [GistHistory[]]$History
    [Uri]$HtmlUrl
    [String]$Id
    [GistUser]$Owner
    [Bool]$Public
    [Uri]$PullUrl
    [Uri]$PushUrl
    [Bool]$Truncated
    [DateTime]$UpdatedAt
    [Uri]$Url
    
    # This contructor works passing a gist response from the API directly into it.
    Gist([Object]$object) {
        $this.CommentsUrl = $object.comments_url
        $this.Comments = $object.comments
        $this.CommitsUrl = $object.commits_url
        $this.CreatedAt = $object.created_at
        $this.Description = $object.Description
        $this.Files = $object.files.PSObject.Properties.Value
        $this.Forks = $object.forks
        $this.ForksUrl = $object.forks_url
        $this.History = $object.history
        $this.HtmlUrl = $object.html_url
        $this.Id = $object.id
        $this.Owner = $object.owner
        $this.Public =$object.public
        $this.PullUrl = $object.git_pull_url
        $this.PushUrl = $object.git_push_url
        $this.Truncated = $object.truncated
        $this.UpdatedAt = $object.updated_at
        $this.Url = $object.url
    }

    # Constructor for manually defining properties.
    # these are the properties that are settable when creating a new Gist via the API.
    Gist([String]$Description, [GistFile[]]$Files, [Bool]$Public) {
        $this.Description = $Description
        $this.Files = $Files
        $this.Public = $Public
    }

    # TODO: develope Create() and Delete() methods.
}

Class GistChangeStatus {
    [Int]$Additions
    [Int]$Deletions
    [Int]$Total

    # The change_status property of the Gist object can be passed directly into this constructor.
    GistChangeStatus([Object]$object) {
        $this.Additions = $object.additions
        $this.Deletions = $object.deletions
        $this.Total = $object.total
    }
}

Class GistComment {
    [String]$Body
    [String]$CommentId
    [DateTime]$CreatedAt
    [String]$Id
    [DateTime]$UpdatedAt
    [GistUser]$User
    [Uri]$Url
    
    GistComment([Object]$object, [String]$id) {
        $this.Body = $object.body
        $this.CommentId = $object.id
        $this.CreatedAt = $object.created_at
        $this.Id = $id
        $this.UpdatedAt = $object.updated_at
        $this.Url = $object.url
        $this.User = $object.user
    }
}

Class GistFile {
    [String[]]$Content
    [String]$FileName
    [String]$Language
    [Uri]$RawUrl
    [Int]$Size
    [String]$Type
    [Bool]$Truncated

    # These properties are hard to locate, but they are the ones we care about.
    # <GistObject>.files.PSObject.Properties.Value
    # If a Gist is retreived by any means other then the Id, the content, forks, and history are stripped.
    # This files property of the Gist object can be passed directoy into this constructor.
    GistFile([Object]$object) {
        $this.FileName = $object.filename
        $this.Language = $object.language
        $this.RawUrl = $object.raw_url
        $this.Size = $object.size
        $this.Type = $object.Type
        $this.Truncated = $object.truncated

        $this.Content = if ([String]::IsNullOrEmpty($object.content)) { 
            $this.GetFileContent() 
        } else { 
            $object.content 
        }
    }

    # Adds a method to get the content of a Gist file.
    # (Get-GitHubGist | Select -First 1).Files[0].GetContent()
    [String[]] GetFileContent() {
        return Invoke-RestMethod -Method Get -Uri $this.RawUrl
    }
}

Class GistFork {
    [DateTime]$CreatedAt
    [String]$Id
    [DateTime]$UpdatedAt
    [GistUser]$User
    [Uri]$Url

    # The forks property of the Gist object can be passed directly into this constructor.
    GistFork([Object]$object) {
        $this.CreatedAt = $object.created_at
        $this.Id = $object.id
        $this.UpdatedAt = $object.updated_at
        $this.User = $object.user
        $this.Url = $object.url
    }
}

Class GistHistory {
    [GistChangeStatus]$ChangeStatus
    [DateTime]$CommittedAt
    Hidden [String]$Id
    [Uri]$Url
    [GistUser]$User
    [String]$Version

    # The history propty of the Gist object can be passed directly into this constructor.
    GistHistory([Object]$object) {
        $this.ChangeStatus = $object.change_status
        $this.CommittedAt = $object.committed_at
        $this.Id = ([Uri]$object.url).Segments[2].TrimEnd('/')
        $this.Url = $object.url
        $this.User = $object.user
        $this.Version = $object.version
    }

    [GistFile[]] GetFile() {
        return ((Invoke-WebRequest -Uri $this.Url).Content | ConvertFrom-Json).files.PSObject.Properties.Value
    }
}

Class GistUser {
    [Uri]$AvatarUrl
    [Uri]$EventsUrl
    [Uri]$FollowersUrl
    [Uri]$FollowingUrl
    [Uri]$GistsUrl
    [String]$GravatarId
    [Uri]$HtmlUrl
    [String]$Id
    [String]$Login
    [Uri]$OrganizationsUrl
    [Uri]$ReceivedEventsUrl
    [Uri]$ReposUrl
    [Bool]$SiteAdmin
    [Uri]$StarredUrl
    [Uri]$SubscriptionsUrl
    [String]$Type
    [Uri]$Url

    # The owner object returned from the API call to a Gist can be passed directly into this constructor.
    GistUser([Object]$object) {
        $this.AvatarUrl = $object.avatar_url
        $this.EventsUrl = $object.events_url
        $this.FollowersUrl = $object.followers_url
        $this.FollowingUrl = $object.following_url
        $this.GistsUrl = $object.gists_url
        $this.GravatarId = $object.gravatar_id
        $this.HtmlUrl = $object.html_url
        $this.Id = $object.Id
        $this.Login = $object.login
        $this.OrganizationsUrl = $object.organizations_url
        $this.ReceivedEventsUrl = $object.received_events_url
        $this.ReposUrl = $object.repos_url
        $this.SiteAdmin = $object.site_admin
        $this.StarredUrl = $object.starred_url
        $this.SubscriptionsUrl = $object.subscriptions_url
        $this.Type = $object.type
        $this.Url = $object.url
    }
}
