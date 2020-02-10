# 目录

- 爬虫的介绍



#爬虫的介绍

何为爬虫？访问网页并且把信息保存下来，但是不是通过人手工完成，而是通过程序完成。所以爬虫对一个内容生产的网站的作用是一把双刃剑。  

搜索引擎是一个超级爬虫系统，它日夜不停的爬取各种网页，对他们的信息进行清洗，排序，然后向使用搜索引擎的人们提供服务，我们使用的谷歌就是，还有搜狗，雅虎等等。

我们平时的爬虫更多的是自己手动写的一个程序脚本，一个项目，功能非常的弱，规模非常的小。当然，现在大数据时代，有很多专门从事数据分析的公司，他们建立了专业的爬虫系统，以此基础上进行数据分析，或者商业信息搜集，比如很多不法公司利用大数据进行用户肖像描绘，首先就要用到爬虫，对普通用户的网上行为进行全方位的搜集，就像侦探一样四处监视打听你。

爬虫的坏处可以有很多种。比如一个网站辛辛苦苦鼓励用户写下来的有价值的信息，被另外一个系统轻而易举的爬走了，那么这就涉及侵犯利益。再比如，针对12306的爬虫，每秒N次请求登录，一来是对12306造成沉重的服务器压力，正常的访问请求不能满足，而且票已经放出来就被抢走，让普通乘客难以买到票。

DDOS（读作D道思）, distribution denial of service, 分布式拒绝服务攻击。通俗的打个比方，你有一个电话号码，一个讨厌你的人知道了，他就派很多人以不同的号码24小时不间断的给你打电话，占线，让你无法正常通信。或者好比你开了一间店，有一伙流氓天天去你店门口溜达不买东西，站着店门口的空间，导致你没发正常营业。如果爬虫频繁的对一个网站进行请求，达到某一个量就会形成DDOS攻击，所以爬虫对一个网站，有的时候是挺有危害的。所以，一般会设置反爬虫政策来针对爬虫。

现在的网站的架构逐步提升，越来越能够抗住每秒千万级访问，甚至更多，但是它们还是会通过各种手段来限制爬虫，这更多是保护信息资产考虑的。

我们在写爬虫的时候，初学的时候就应该知道，爬虫应该被用在合法的渠道和目的上。



# 知识点

本次知识点在专栏  https://zhuanlan.zhihu.com/p/24669128 的基础上，增加了大量的个人笔记和心得。

并且通过几个项目来完成简单的体验一下爬虫。

本教程以scrapy 为例，scrapy 是 用 Python 写的一个多线程爬虫，功能应该是比较强大和高效的，我目前也只会一点皮毛，主要是用多少，学多少。

本次就把学到的一点东西记录下来。



##  创建一个爬虫项目

首先需要安装 python，本次环境python 3.6.x，Scrapy  1.8.0 ,

创建项目：`scrapy startproject scrapyspider`

```
scrapyspider/
    scrapy.cfg
    scrapyspider/
        __init__.py
        items.py
        pipelines.py
        settings.py
        spiders/
            __init__.py
            ...
```

创建一个爬虫  

`cd PROJECT_DIR`

`scrapy genspider example example.com`

```
from scrapy.spiders import Spider

class BlogSpider(Spider):
    name = 'woodenrobot'
    start_urls = ['http://woodenrobot.me']
    def parse(self, response):
        titles = response.xpath('//a[@class="post-title-link"]/text()').extract()
        for title in titles:
            print title.strip()
```

启动爬虫  scrapy crawl woodenrobot  

## 入门项目：爬取豆瓣经典top250电影

### 为什么要使用Item？

TODO



### 如何写一个Item

```python
import scrapy

class DoubanMovieItem(scrapy.Item):
    # 排名
    ranking = scrapy.Field()
    # 电影名称
    movie_name = scrapy.Field()
    # 评分
    score = scrapy.Field()
    # 评论人数
    score_num = scrapy.Field()
```



## 爬虫代码

```python
from scrapy.spiders import Spider
from scrapyspider.items import DoubanMovieItem


class DoubanMovieTop250Spider(Spider):
    name = 'douban_movie_top250'
    start_urls = ['https://movie.douban.com/top250']
    
    def parse(self, response):
        item = DoubanMovieItem()
```

### 如何要登录怎么办？

如果您想要修改最初爬取某个网站的Request对象，您可以重写(override)该方法。 例如，如果您需要在启动时以POST登录某个网站，你可以这么写:

```python
def start_requests(self):
    return [scrapy.FormRequest("http://www.example.com/login",
                               formdata={'user': 'john', 'pass': 'secret'},
                               callback=self.logged_in)]

def logged_in(self, response):
    # here you would extract links to follow and return Requests for
    # each of them, with another callback
    pass
```

### 如何学习Xpath

https://www.w3school.com.cn/xpath/xpath_nodes.asp 



### 练习Xpath

```
<ol class="grid_view">
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">1</em>
                    <a href="https://movie.douban.com/subject/1292052/">
                        <img alt="肖申克的救赎" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480747492.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292052/" class="">
                            <span class="title">肖申克的救赎</span>
                                    <span class="title">&nbsp;/&nbsp;The Shawshank Redemption</span>
                                <span class="other">&nbsp;/&nbsp;月黑高飞(港)  /  刺激1995(台)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 弗兰克·德拉邦特 Frank Darabont&nbsp;&nbsp;&nbsp;主演: 蒂姆·罗宾斯 Tim Robbins /...<br>
                            1994&nbsp;/&nbsp;美国&nbsp;/&nbsp;犯罪 剧情
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.6</span>
                                <span property="v:best" content="10.0"></span>
                                <span>766719人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">希望让人自由。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        ...
        ...
        ...
</ol>
```



### xpath写法

| nodename | 选取此节点的所有子节点。                                   |
| -------- | ---------------------------------------------------------- |
| /        | 从根节点选取。                                             |
| //       | 从匹配选择的当前节点选择文档中的节点，而不考虑它们的位置。 |
| .        | 选取当前节点。                                             |
| ..       | 选取当前节点的父节点。                                     |

text()

@src

response.xpath('//h2/text()').extract()  

response.xpath('//img/@src').extract()  

response.xpath('//p[@class="location"]/text()').extract()  

response.xpath('//div[@class="companies"]/div[2]').xpath('.//a/@href').extract()  

response.xpath('//div[contains(@class, "name2")]/text()').extract() 

如果同时又多个条件需要写，可以使用 and、or 关键字。

xpath('//div[contains(@class,"a") or contains(@class,"b")]')



### re_first

response.css('div#images a::text').re('Name: (.+) ')



去前后空格  
course.css('span.course-type::text').extract_first().strip(),

### 最终代码

```python
from scrapy.spiders import Spider
from scrapyspider.items import DoubanMovieItem


class DoubanMovieTop250Spider(Spider):
    name = 'douban_movie_top250'
    start_urls = ['https://movie.douban.com/top250']
    
    def parse(self, response):
        item = DoubanMovieItem()
        movies = response.xpath('//ol[@class="grid_view"]/li')
        for movie in movies:
            item['ranking'] = movie.xpath(
                './/div[@class="pic"]/em/text()').extract()[0]
            item['movie_name'] = movie.xpath(
                './/div[@class="hd"]/a/span[1]/text()').extract()[0]
            item['score'] = movie.xpath(
                './/div[@class="star"]/span[@class="rating_num"]/text()'
            ).extract()[0]
            item['score_num'] = movie.xpath(
                './/div[@class="star"]/span/text()').re(ur'(\d+)人评价')[0]
            yield item
```



## 运行

```text
scrapy crawl douban_movie_top250 -o douban.csv
```



### 403错误

这是因为豆瓣对爬虫设了一个小小的门槛，我们只需要更改一下发送请求时的请求头user-agent即可。



```python
headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36',
    }
```

修改代码如下：

```python
from scrapy import Request
from scrapy.spiders import Spider
from scrapyspider.items import DoubanMovieItem


class DoubanMovieTop250Spider(Spider):
    name = 'douban_movie_top250'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36',
    }

    def start_requests(self):
        url = 'https://movie.douban.com/top250'
        yield Request(url, headers=self.headers)

    def parse(self, response):
        item = DoubanMovieItem()
        movies = response.xpath('//ol[@class="grid_view"]/li')
        for movie in movies:
            item['ranking'] = movie.xpath(
                './/div[@class="pic"]/em/text()').extract()[0]
            item['movie_name'] = movie.xpath(
                './/div[@class="hd"]/a/span[1]/text()').extract()[0]
            item['score'] = movie.xpath(
                './/div[@class="star"]/span[@class="rating_num"]/text()'
            ).extract()[0]
            item['score_num'] = movie.xpath(
                './/div[@class="star"]/span/text()').re(ur'(\d+)人评价')[0]
            yield item
```

## 自动翻页

```python
from scrapy import Request
from scrapy.spiders import Spider
from scrapyspider.items import DoubanMovieItem


class DoubanMovieTop250Spider(Spider):
    name = 'douban_movie_top250'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36',
    }

    def start_requests(self):
        url = 'https://movie.douban.com/top250'
        yield Request(url, headers=self.headers)

    def parse(self, response):
        item = DoubanMovieItem()
        movies = response.xpath('//ol[@class="grid_view"]/li')
        for movie in movies:
            item['ranking'] = movie.xpath(
                './/div[@class="pic"]/em/text()').extract()[0]
            item['movie_name'] = movie.xpath(
                './/div[@class="hd"]/a/span[1]/text()').extract()[0]
            item['score'] = movie.xpath(
                './/div[@class="star"]/span[@class="rating_num"]/text()'
            ).extract()[0]
            item['score_num'] = movie.xpath(
                './/div[@class="star"]/span/text()').re(ur'(\d+)人评价')[0]
            yield item

        next_url = response.xpath('//span[@class="next"]/a/@href').extract()
        if next_url:
            next_url = 'https://movie.douban.com/top250' + next_url[0]
            yield Request(next_url, headers=self.headers)
```



# scrapy 调试

## scrapy 提供的 内部调试
```python
from scrapy.shell import inspect_response
inspect_response(response, self)
...
view(response)
```


## pycharm 调试
新建 run.py， 填入一下代码

```python
from scrapy import cmdline
name = 'douban_movie_top250'
cmd = 'scrapy crawl {0}'.format(name)
cmdline.execute(cmd.split())
```
然后在要运行的爬虫代码里打断点

# 爬虫协议

scrapy 是一个遵守爬虫协议的工具，当要对某一个域名爬取的时候，会先看对方网站的爬虫政策。  



# start_urls 和 start_requests

如下：可以使用方法动态构建 start_urls 并使用装饰器装饰成属性 

```
    @property
    def start_urls(self):
        """ start_urls  需要返回一个可迭代对象，所以，你可以把它写成一个列表、元组或者生成器，这里用的是列表
        """
        url_list = ['https://www.shiyanlou.com/courses/',
                    'https://www.shiyanlou.com/courses/?page_size=20&cursor=bz0yMA%3D%3D',
                    'https://www.shiyanlou.com/courses/?page_size=20&cursor=bz00MA%3D%3D']
        return url_list
```



# 模拟点击下拉列表

https://blog.csdn.net/u013372487/article/details/45843673



