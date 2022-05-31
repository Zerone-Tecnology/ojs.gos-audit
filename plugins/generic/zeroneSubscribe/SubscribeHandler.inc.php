<?php

class SubscribeHandler extends Handler {

    public function index($args, $request)
    {
        $plugin = PluginRegistry::getPlugin('generic','zeroneSubscribe');
        $apiUrl = $request->getDispatcher()->url($request, ROUTE_API, $request->getContext()->getPath(), 'subscribe');
        $templateMgr = TemplateManager::getManager($request);
        return $templateMgr->display($plugin->getTemplateResource('example.tpl'));

    }
}