Optionally using VARIABLES.  Provide HOST and CALLBACK fn."
  "Default warning message."
(cl-defmethod code-review-core-set-labels ((_gitlab code-review-gitlab-repo) _callback)
(cl-defmethod code-review-core-set-assignee ((_gitlab code-review-gitlab-repo) _callback)
(cl-defmethod code-review-core-set-milestone ((_gitlab code-review-gitlab-repo) _callback)
(cl-defmethod code-review-core-set-title ((_gitlab code-review-gitlab-repo) _callback)
(cl-defmethod code-review-core-set-description ((_gitlab code-review-gitlab-repo) _callback)
(cl-defmethod code-review-core-merge ((_gitlab code-review-gitlab-repo) _strategy)
(cl-defmethod code-review-core-new-issue-comment ((gitlab code-review-gitlab-repo) comment-msg callback)
  "Create a new comment issue for GITLAB sending the COMMENT-MSG and call CALLBACK."
  (glab-post (format "/v4/projects/%s/merge_requests/%s/notes"
                     (code-review-gitlab--project-id gitlab)
                     (oref gitlab number))
             nil
             :auth 'code-review
             :host code-review-gitlab-host
             :payload (a-alist 'body comment-msg)
             :callback callback
             :errorback #'code-review-gitlab-errback))
