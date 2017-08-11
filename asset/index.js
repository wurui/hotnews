define(['mustache','oxjs'],function(Mustache,OX){
    var tpl,$list;
    var href_prefix='https://www.openxsl.com/app/git/wurui/'
  return {
    init:function($mod){
        tpl=$('.J_tpl',$mod).html();
        $list=$('.J_list',$mod);
        var restNews=OX.useREST('news/59892417d7372b422cc4564b');
        restNews.get({
            filter:'title,origin_id,cmt,time,type',
            limit:500
        },function(r){
//未登录提示
            if(r && r.length){
                var data=[];
                for(var i=0,n;n=r[i++];){
                    if(n.cmt){
                        switch (n.type){
                            case 'img':
                                n.href=href_prefix+'img?id='+n.origin_id
                                break
                            case 'article':
                                n.href=href_prefix+'detail?id='+n.origin_id
                            default :
                                break
                        }
                        data.push(n)
                    }
                }
                data.sort(function(a,b){
                    return a.cmt > b.cmt ?-1:1;
                });
                $list.html(Mustache.render(tpl,data.slice(0,20)))
            }
            $('.J_time',$mod).html('数据获取时间:'+(new Date).toLocaleString())

        })

        //$.getJSON('https://www.openxsl.com/rest_dev/news/59892417d7372b422cc4564b?callback=?',
    }
  }
})
