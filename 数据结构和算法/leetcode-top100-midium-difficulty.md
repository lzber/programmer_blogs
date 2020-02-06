# 目录

- @15 三数之和 FINISH 考察思维：难度分解
- @309 买卖股票时机含冷冻期
- @322 零钱兑换
- @39 组合总和

- @11 剩水最多的容器 FINISH  考察点：一个滑动的窗口如何滑动的问题。
- @338 比特位计数

- @739 每日温度 FINISH 考点：栈
- @394 字符串解码 考点:和栈想关
- @399 除法求值 
- @438 找到字符串中所有字母的异位词 考察：滑动窗口
- @34 在排序数组中查找元素的第一个和最后一个位置 考察：二分查找
- @287 寻找重复数 考察:一道简单的题加了限制就不容易了，感觉先放一放吧，有个什么意义呢？


- @22 括号生成 考察：全排列+栈
- @49 字母异位词分组
- @337 打家劫舍3
- @55 跳跃游戏
- @215 数组中的第K个最大元素
- @146 LRU缓存机制
- @17 电话号码的字母组合

- @300 最长上升子序列
- @5 最长回文子串
- @3 无重复字符的最长子串
- @236 二叉树的最近公共祖先
- @221 最大正方形
- @152 乘积最大子序列
- @56 合并区间
- @64 最小路径和
- @31 下一个排列
- @200 岛屿数量
- @647 回文子串
- @416 分割等和子集
- @279 完全平方数

- @238 出自身以外数组的乘积
- @406 根据身高重建队列
- @19 删除链表的倒数第N个节点
- @48 旋转图像
- @240 搜索二维矩阵

- @75 颜色分类

- @560 和为K的子数组
- @33 搜索旋转排序数组


- @78 子集
- @494 目标和
- @621 任务调度器
- @347 前K个高频元素
- @62 不同路径
- @139 单词拆分
- @79 单词搜索

- @142 环形链表2
- @148 排序链表

- @94 二叉树的中序遍历
- @102 二叉树的层次遍历
- @98 验证二叉搜索树
- @96 不同的二叉搜索树
- @208 实现Trie(前缀树)
- @105 从前序与中序遍历构造二叉树
- @114 二叉树展开为链表
 

- @207 课程表 考察点：图中环的检测

## 熟悉的
- @46 全排列

@338
338. 比特位计数
给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。

示例 1:

输入: 2
输出: [0,1,1]
示例 2:

输入: 5
输出: [0,1,1,2,1,2]
进阶:

给出时间复杂度为O(n*sizeof(integer))的解答非常容易。但你可以在线性时间O(n)内用一趟扫描做到吗？
要求算法的空间复杂度为O(n)。
你能进一步完善解法吗？要求在C++或任何其他语言中不使用任何内置函数（如 C++ 中的 __builtin_popcount）来执行此操作。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/counting-bits
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

@15
```
def threeSum(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        res = []
        if(not nums or n<3):
            return []
        nums.sort()
        res = []
        for i in range(n):
            if(nums[i]>0):
                return res
            if(i>0 and nums[i]==nums[i-1]):
                continue
            L = i+1
            R = n-1
            while(L<R):
                if(nums[i]+nums[L]+nums[R]==0):
                    res.append([nums[i], nums[L], nums[R]])
                    while(L<R and nums[L]==nums[L+1] ):
                        L = L+1
                    while(L<R and nums[R]==nums[R-1]):
                        R = R-1
                    L += 1
                    R -= 1
                elif(nums[i]+nums[L]+nums[R] > 0):
                    R -= 1
                else:
                    L += 1    
        return res
```

#### [448. 找到所有数组中消失的数字](https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array/)

给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。

找到所有在 [1, n] 范围之间没有出现在数组中的数字。

您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。

示例:

输入:
[4,3,2,7,8,2,3,1]

输出:
[5,6]

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

@11
class Solution:
    def maxArea(self, height: List[int]) -> int:
        i, j, = 0, len(height)-1
        res = min(height[i], height[j])*(j-i)
        while i< j:
            if(height[i] < height[j]):
                i2 = i+1
                while i2<j and height[i2]<=height[i]:
                        i2 += 1
                i = i2
                res = max(res, min(height[i], height[j])*(j-i))
            else:
                j2 = j-1
                while i<j2 and height[j2]<=height[j]:
                        j2 -= 1
                j = j2
                res = max(res, min(height[i], height[j])*(j-i))
        return res



#### [461. 汉明距离](https://leetcode-cn.com/problems/hamming-distance/)

两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

给出两个整数 x 和 y，计算它们之间的汉明距离。

注意：
0 ≤ x, y < 231.

示例:

输入: x = 1, y = 4

输出: 2

解释:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

上面的箭头指出了对应二进制位不同的位置。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/hamming-distance
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。



#### [198. 打家劫舍](https://leetcode-cn.com/problems/house-robber/)

你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。

示例 1:

输入: [1,2,3,1]
输出: 4
解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。
示例 2:

输入: [2,7,9,3,1]
输出: 12
解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/house-robber
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。



#### [283. 移动零](https://leetcode-cn.com/problems/move-zeroes/)

给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

示例:

输入: [0,1,0,3,12]
输出: [1,3,12,0,0]
说明:

必须在原数组上操作，不能拷贝额外的数组。
尽量减少操作次数。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/move-zeroes
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

