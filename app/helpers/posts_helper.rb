module PostsHelper
    def sentence_choose_new_or_edit
        if action_name == "new" || action_name == "create" 
            "ツイートの作成"
        elsif action_name == "edit"
            "ツイートの編集"
        end
    end

    def choose_new_or_edit
        if action_name == 'new' || action_name == 'create'
          confirm_posts_path
        elsif action_name == 'edit'
          post_path
        end
      end
end
