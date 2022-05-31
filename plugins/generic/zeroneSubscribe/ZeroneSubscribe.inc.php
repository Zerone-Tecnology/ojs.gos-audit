<?php



import('lib.pkp.classes.plugins.GenericPlugin');
class ZeroneSubcribe extends GenericPlugin {

    public function register($category, $path, $mainContextId = null)
    {
        $success =  parent::register($category, $path);

        if ($success && $this->getEnabled()) {
            HookRegistry::register('PublishedArticleDAO::_returnPublishedArticleFromRow', function (&$publishedArticle, &$row) {
                $news = new \Zerone\News();
                $follower = new \Zerone\Follower("published@gmail.com");
                $news->attach($follower);
            });
        }

        return $success;
    }






    function getDisplayName()
    {
       return 'Zerone';
    }

    function getDescription()
    {
        return 'Notify subscribers';
    }
}