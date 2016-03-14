# Just a set of problems and topices for mind recalling(concept mostly with little code)

### templates

arbitary jump template
[check](#10fuck)
<a name="10fuck"></a>

color template
<font color="green" size="6">
<a name="fuccccc"></a>
fucckkkkk
</font>

### you should always keep the following in mind. And these things are not precise description but an reminding.

# table of contents
1. [Data structure & Algorithm](#Akeyqw)
    1. [Linear Data Structure](#lineards)
    2. [Non-Linear Data Structure](#nonlineards)
2. [Computer network](#Bnetwork)
3. [Computer architecture](#Cccarg)
4. [Operating system & system programming](#Doperatingsystem)
5. [Concurrency Programming & Network Programming in Practice](#Econcurrency)
6. [Distributed system](#Fuckdistributed)
7. [AI & Deep-learning, Principle & Practice](#Godknow)
8. [Best Practice in code and design](#Hbestpractice)
9. [Database](#Jjkkn)
10. [others](#Zzzfweq)

<a name="Akeyqw"></a>

# Data structure & Algorithm 

* Algorithm practice experience

    * 微软100题 [fuckit](http://blog.csdn.net/v_july_v/article/details/6870251)

    * **MUST KNOW TECNICH** [something you must know](https://www.zhihu.com/question/24964987)

        * LCS [check](#algo:lcs)

        * Two pointer [check](#twopointer)

        * union find [check](#unionfind)

        * Binary Search  [check](#binarysearch)

        * divide and conquer [check](#divideandconquer)

        * DFS & BFS [check](#dfsandbfs)

        * backtracking [check](#backtracking)

        * dynamic programming [check](#dynamicprogramming)

        * quick sort [check](#quicksort)

        * stack & queue [check](#stackandqueue)

        * linked list[check](#linkedlist)

        * hash table [check](#hashtable)

        * heap [check](#heap)

        * trie [check](#trie)

    * Basic practice when solving algorithm problem are : 1.由简至繁，找规律 2.猜解法，再想怎么解

    * leetcode & advance skill

        * translate question [ref](https://discuss.leetcode.com/topic/67881/single-pass-c-o-n-space-and-time-solution-8-lines-with-detailed-explanation). My solution is a state machine, enumerate all possible state transmission. His solution is a D&C approach, translate original question to two parts : 1. maintain the argument of final check 2. do final check.

        * virtual index [ref](https://discuss.leetcode.com/topic/32929/o-n-o-1-after-median-virtual-indexing/2)

        * number base transfer [ref](https://leetcode.com/problems/remove-9/)

        * fibonacci using matrix [ref](http://www.geeksforgeeks.org/program-for-nth-fibonacci-number/)

        * two level pointer [linus](#fuckinglinus)

        * use bitmask to help to represent one solution in the solution space, it also looks like combination. [ref](http://www.geeksforgeeks.org/bitmasking-and-dynamic-programming-set-1-count-ways-to-assign-unique-cap-to-every-person/) In this link, note that, **for (int j = 0; j < size; j++)** try to add up all ways when cap-id-x assign to one person who have this cap. In this link, one solution is defined as a cap person assignment with particular constrait, and we use bitmask to help to represent this process.

        * bitmask can also be used to solve n-queen problem[ref](https://discuss.leetcode.com/topic/13617/accepted-4ms-c-solution-use-backtracking-and-bitmask-easy-understand) by doing so, we abstract and redefine the represent of one solution or partial solution.

        * digit with dp [ref](http://www.geeksforgeeks.org/digit-dp-introduction/) the key is **// base case if (idx == -1) return sum;** --- **// fetching answer from next state** --- **if (!tight) dp[idx][sum][tight] = ret;** . This is just a particular practice in dp.

* Reference

    * [A quick review](https://www.tutorialspoint.com/data_structures_algorithms/dynamic_programming.htm) & [A project include all the implement of algorithm written by me](https://github.com/DeathPoem/Practice/tree/master/algorithm-and-practice) read more in repo "Practice"/interview_problem_set/ReadMe.md and /advanced-algorithm  & [google intetview university](https://github.com/jwasham/google-interview-university) this is also a great guide. [wikipedia-list of algorithm](https://en.wikipedia.org/wiki/List_of_algorithms) GGGREAT!

    * visual go [ref](https://visualgo.net/en/sorting)

<a name="lineards"></a>

#### Linear Data Structure

<a name="linkedlist"></a>
* stack & queue is implemented by deque is implemented by vector

    * Singly linked list    

        <a name="fuckinglinus"></a>        
        1. solve linked list delete with [two level pointer](http://coolshell.cn/articles/8990.html)
            
            **the idea is : using a pointer to point to the entry which is the next one we may keep, which at the beginning is head.**

            **then, instead of create new link between nodes, this method substite the old one by the next possible**

            1->2->3->4->5   =>>  1-> <s>[2->3->]</s> 4 ->5

            ``` cpp
                void remove_if(node ** head, remove_fn rm) {
                    for (node** curr = head; *curr; ) { 
                    // entry present the next one we may keep, curr point to it
                    // entry->next present the next checking one 
                        node * entry = *curr;
                        if (rm(entry)) {
                            *curr = entry->next;    // substite entry by next entry
                            free(entry);
                        } else {
                            curr = &entry->next; 
                            // didn't modify *curr means the last one may keep is kept. And here entry is the kept one.
                            // it's guranteed that the last kept one point to *curr
                        }
                    }
                    // the *head is the new list
                }
            ```
        2. following is a code to delete duplicated nodes in list [dup delete](#dupdelete)

    * Doubly linked list
        1. One interesting property about double linked list is that the node can remove itself without other reference

    * Circular linked list

    * Skip list

    <a name="stackandqueue"></a>
    * stack : stack is a FILO structure

    * queue : queue is a FIFO structure [good problem, 剑指offer滑动窗口最大值](https://www.nowcoder.com/practice/1624bc35a45c42c0bc17d17fa0cba788?tpId=13&tqId=11217&tPage=4&rp=4&ru=%2Fta%2Fcoding-interviews&qru=%2Fta%2Fcoding-interviews%2Fquestion-ranking)

    * circular queue : [ref](https://en.wikipedia.org/wiki/Circular_buffer)

    * deque : deque is a **d**ouble **e**nd **que**ue, internal data structure is list of vectors,  [implement](https://stackoverflow.com/questions/6292332/what-really-is-a-deque-in-stl)

    * Priority queue(heap) [heap](#heap)

* Sequence Problem [check me](#typicalsequence)

* Sequence Search

    * Linear search

    <a name="binarysearch"></a>
    * Binary search
        [problem : Split Array Largest Sum, solved by binary search + greedy](https://discuss.leetcode.com/topic/61324/clear-explanation-8ms-binary-search-java)

    * Interpolation search  : improvement over binary search [ref](http://www.geeksforgeeks.org/interpolation-search/)

    <a name="hashtable"></a>
    * Hash table

        * hash collision resolution :

            * linked lists

            * probing hashing table- linear probing, quadratic probing

            * double hashing

        * Rehashing, when hash table is too big, build another hashtable that is twice as big as before and rehash the elements.

* Sequence Sorting

    * Bubble :
        Bubble sort is a simple algorithm repeatedly steps through compare adjacent items and swap if in the wrong order.

        <font color="green">
        Pseducode

            while notsorted do :
                for set index = from 0 to last unsorted index
                    sort two and swap for index and index + 1
        </font>

    * Insertion :
        Insertion sort is a simple algorithm build sorted sequence one more at one pass

        <font color="green">
        Pseducode

            for i = 0 to size - 1
                find them pos in sorted eles from eles[i] to eles[0] and insert it, so we have i ele in order
        </font>

    * Selection :
        Selection sort is a in-place comparison algorithm emplace the minimun one at a time.

        <font color="green">
        Pseducode

            for i = from 0 to size - 1
                go through all to find minimum and swap
        </font>

    * Merge :
        An Effecient D&C algorithm. First, divide into smallest unit. Second, compare each eles with adjacent and merge them.

        <font color="red">
        Classic Problem : using merge sort to calculate sequence inversion
        </font>

        <font color="green">
        Pseducode

            divide all into smallest part
            for each two part
                sort them as new part by compare and push into new part
        </font>

    * Shell 希尔排序 :
        Shell sort is an in-place comparison sort and a generalization of insertion sort. It need a gap sequence to active(which ends at gap[j] = 1), for the N turn of running, it would devide data into separate subarrays whose eles have a distance of gap[N], then perform insertion sort.

        <font color="green">
        Pseducode

            for each gap in gap sequence
                for i from gap to array.size() - 1
                    tmp = array[i]
                    for j = i; j >= gap && tmp < a[j - gap]; j -= gap
                        a[j] = a[j - gap]
                    a[j] = tmp
        </font>

    <a name="quicksort"></a>
    * Quick :
        Quick sort is a D&C algorithm. First divides a large array into two smaller sub-arrays (low-ele and high-ele). Second recursively sort the sub-array. Looks very much like binary tree.
        Note : *random Quick sort* would set a random unsorted partition then swap with first ele, then set it as pivot.

        <font color="green">
        Pseducode

            for each unsorted partition
                set first ele as pivot
                remove small than pivot to left and bigger to right
                then swap pivot with the rightest of left
        </font>

    * Timsort :
        Timesort is a hybrid algorithm, derived from merge sort and insertion sort. It's designed to take advantage of partial orderings that exist in most real-world data. **check wikipedia** [wiki](https://en.wikipedia.org/wiki/Timsort) [geek](http://www.geeksforgeeks.org/timsort/)

        <font color="green">
        Pseducode
            assign const var RUN
            insertsort for each segment length equals to RUN
            merge these sorted RUNs
        </font>

    * Counting (similar to bucket sort) :
        Counting sort is integer sorting where variation in items is not significantly greater than number of eles.

        <font color="green">
        Pseducode

            build counting list when read ele by counting[ele] += 1
            for every ele in counting list, print index if value is > 0
        </font>

    * Heapsort :
        Heap sort can be thought of an improved selection sort, dividing its input into a sorted and an unsorted region, it iteratively shrinks the unsorted region by extracting the largest element into sorted region.

        <font color="green">
        Pseducode
            
            insert ele into a heap
                deleteMax N times and get the sorted list
        </font>

    * Radix (card sort):
        Radix sort sorts every digits, from least significant to most significant.

        <font color="green">
        Pseducode

            create digits slots 0-9
                while unsorted digit
                    sort them with more significant digit, begin with digit-0
                    release them into a list
        </font>

    * Bucket :（我草，the introduction to algorithm 和 data structure and algorithm 对 bucket sort 的定义居然不一样， 此处用tita的定义）
        Bucket sort distributed elements which is in a range of [0,1), with 10 buckets we would build. read ele and put into bucket[first digit of ele] and sort this bucket, then print buckets by their own order to get sorted list.

        <font color="green">
        Pseducode
            
            put ele into bucket by their first digit
            sort each bucket
            print
        </font>

<a name="nonlineards"></a>

#### Non-linear Data Structure

* Tree Heap & Graph

    <a name="dfsandbfs"></a>
    * Depth first traversal & Breadth first traversal (too easy to say it out)

    * tree traversal : pre-order in-order post-order

    * Tree Collection

        * Huffman tree is a compress method to minumis information bits [ref](http://www.geeksforgeeks.org/greedy-algorithms-set-3-huffman-coding/)

            1. 带权路径长度

        <a name="trie"></a>
        * Trie tree(prefix tree, digital tree, radix tree(one path have multiple char)) 
            1. can be used to (1) map a string as key to a value, as a replacement for hash table. (2) We can use it to make lexicographic sorting for many strings by preorder-traversal it.
            2. code [check](#triecode)

        * Suffix tree 
            [different between suffix tree and trie](https://stackoverflow.com/questions/13893950/suffix-tree-and-tries-what-is-the-difference) , 
            [geekforgeek,from trie to suffix tree](http://www.geeksforgeeks.org/pattern-searching-set-8-suffix-tree-introduction/), 
            [csdn](http://blog.csdn.net/aiphis/article/details/47106025) 

            1. 单词 "BANANA" 的后缀树. 每个后缀以 $ 结尾. 所有的后缀为 A$, NA$, ANA$,NANA$, ANANA$ and BANANA$. 叶子节点表示后缀的起始坐标. 世界上后缀树就是一个单词的所有后缀组成的字典树, 并且把字典树单词进行了压缩
            2. can be used to 
                1. finding longest common substring 
                2. finding longest palindrome in a string
                3. 查找字符串o是否在字符串S中。 
                方案：用S构造后缀树，按在trie中搜索字串的方法搜索o即可。 
                原理：若o在S中，则o必然是S的某个后缀的前缀。 
                例如S: leconte，查找o: con是否在S中,则o(con)必然是S(leconte)的后缀之一conte的前缀.有了这个前提，采用trie搜索的方法就不难理解了。
                1. 指定字符串T在字符串S中的重复次数。 
                方案：用S+’$'构造后缀树，搜索T节点下的叶节点数目即为重复次数 
                原理：如果T在S中重复了两次，则S应有两个后缀以T为前缀，重复次数就自然统计出来了。
                1. 字符串S中的最长重复子串 
                方案：原理同2，具体做法就是找到最深的非叶节点。 这个深是指从root所经历过的字符个数，最深非叶节点所经历的字符串起来就是最长重复子串。 
                为什么要非叶节点呢?因为既然是要重复，当然叶节点个数要>=2。
                1. 两个字符串S1，S2的最长公共部分 
                方案：将S1\#S2\$作为字符串压入后缀树，找到最深的非叶节点，且该节点的叶节点既有\#也有\$(无\#)。'

        * decision tree, 
            
            1. can be used to sorting, forget it , no one would do that. it's logn and more complicated than normal sorting algorithm
            
            2. can be used for Deep Learning.

        * Winner tree, **problem=given a[20], find the second most one in 16 steps, problem2= given k lists of ordered vector, merge them**, for problem2, if we use pair merge, we got O(n * k), if we use winner tree, we got O(n * k), but better than pair merge.[check this post](http://shmilyaw-hotmail-com.iteye.com/blog/1776132)

        <a name="unionfind"></a>
        * union find    (also called  disjoint-set data structure) [wikipedia](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) 1. can be used to partition eles into few groups and check if two ele is in one group(can be used to implement Kruskal's algorithm)

        * Segment tree
            [ref](https://en.wikipedia.org/wiki/Segment_tree)

            problem : ask for sum of subarray from index l to index r,

            why : to solve the problem, simple solution is to go through and sum which got O(n) time. segment tree can do it as O(logn).

            Segment tree :
                step 1 : store element value in leaf nodes, and merge them in father nodes with children sum. note, every node shall have their range.
                step 2 : getsum(node, l, r) :
                    if l, r is out of node range :
                        return 0
                    else if node range is within l, r :
                        return node value
                    else
                        return getsum(node->left, l, r) + getsum(node->right, l, r)

        * binary search tree, is a binary tree right child is bigger than parent and left child is smaller than parent.

            * left rotate

            * right rotate

        * complete binary tree, is a binary tree, nodes is fulfilled from top to bottom, from left to right.

        * Self-balanced tree

            * AVL [geekforgeek](http://www.geeksforgeeks.org/avl-tree-set-1-insertion/)

                * balance condition : every node should have left and right which differ at most 1.

                * single rotate

                                        T1, T2, T3 and T4 are subtrees.
                             z                                      y 
                            / \                                   /   \
                           y   T4      Right Rotate (z)          x      z
                          / \          - - - - - - - - ->      /  \    /  \ 
                         x   T3                               T1  T2  T3  T4
                        / \
                      T1   T2

                * double rotate

                             z                               z                           x
                            / \                            /   \                        /  \ 
                           y   T4  Left Rotate (y)        x    T4  Right Rotate(z)    y      z
                          / \      - - - - - - - - ->    /  \      - - - - - - - ->  / \    / \
                        T1   x                          y    T3                    T1  T2 T3  T4
                            / \                        / \
                          T2   T3                    T1   T2

            * red-black tree, compared to AVL's completely balanced, RB tree's localy balanced needs fewer resource to maintain. [geekforgeek](http://www.geeksforgeeks.org/red-black-tree-set-1-introduction-2/)

                * Rule : 1. leaves are black 2. red has two black child 3. root is black 4. root to null has the same black node

            * Splay tree, is a self-adjust balanced binary search tree. the basic idea of the splay tree is that after a node is accessed, it is pushed to the root (balanced tree at the same time)by a series of AVL tree rotations, because in real practice, it's very offen that one ele to be accessed in near future after last access.

                * splay operation
                    1) Node is root
                    2) Zig: Node is child of root
                    3) Node has both parent and grandparent
                        1) Zig-Zig and Zag-Zag
                        2) Zig-Zag and Zag-Zig

        * B tree, consider a situation where access operation is much more expensive than comparing operation like large database. It's rational to use b children instead of 2 to construct the tree. make access operation to be O(log b N) as comparing operation to be O(b)

            * [wiki](https://en.wikipedia.org/wiki/B-tree#Technical_description)
             
                1. According to Knuth's definition, a B-tree of order m is a tree which satisfies the following properties:
                2. Every node has at most m children.
                3. Every non-leaf node (except root) has at least ⌈m/2⌉ children.
                4. The root has at least two children if it is not a leaf node.
                5. A non-leaf node with k children contains k−1 keys.
                6. All leaves appear in the same level

        * B+ tree, consider a larger database, you need nodes to be index and store your real data only in leaves.

        * B* tree, is a variant of B+ tree.

    <a name="heap"></a>
    * Heap (priority queue)

        * Two operation : 1.insert new ele 2. dequeu the minum ele

        * Implement :

            * Binary heap

                * Two prority : 1. structure prority : complete binary tree, which also can be presented as an array 2. heap order priority

                * insert : 

                    <font color="green">
                        Pseducode

                        BHeap.push(a)
                        while (a < parent of a)
                            swap them
                    </font>

                * extract :
                
                    <font color="green">
                        Pseducode

                        take out BHeap[0]
                        BHeap[0] = BHeap.lastone
                        cur = &BHeap[0]
                        while (cur < children of cur)
                            swap *cur and largest child of *cur
                    </font>

            * d-heap is almost like binary heap except every node has d child

            * leftist heap is an merge operation effeciently supported implement, which is also a binary tree, but a unbalanced one.

            * skew heap is a self-adjusting version of leftist heap

            * binomial queue is not a heap-order tree but rather a collection of heap-order tree, a forest.

        * [problem :smallest range](https://leetcode.com/problems/smallest-range/description/)

    * graph

        * DAG(Directed acyclic graph)

        * topological sorting for a DAG, 
            1. one canonical application is scheduling jobs by their dependencies [wiki](https://en.wikipedia.org/wiki/Topological_sorting)
            2. an implement on [geek](http://www.geeksforgeeks.org/topological-sorting/), [code](#topologicalsort)

        * Minimum height tree = find the middle point of longest path = using topological sort to slice leaves one level by one level [leetcode](https://discuss.leetcode.com/topic/30572/share-some-thoughts)

        * Minimum-Spanning tree is subset of edges of undirected graph connect all nodes together with smallest total weight
            1. Prim
                
                <font color="green">
                    Pseducode

                    given g[v][u]
                    choose arbitary one from V, push it into T,
                    while T is not full
                        find the most least weight one from edge(v, u), where v is already in T, and u is not in T
                    
                </font>
            2. Kruskal

        * Shortest Path algorithm
            1. Dijkstra [code ](#dijkstra)
            2. Bellman-Ford : Dijkstra doesn’t work for Graphs with negative weight edges, Bellman-Ford works for such graphs, [code ](#bellmanford)
            3. Floyd-Warshall : is for solving the All Pairs Shortest Path problem. The problem is to find shortest distances between every pair of vertices in a given edge weighted directed Graph. [code ](#floydwarshall)

        * Max flow algorithm
            1. Ford-Fullkerson [code ](#fordfullkerson)
            2. Edmonds-Karp

        * Multi-commodity problem

        * Travelling salesman problem [geek](http://www.geeksforgeeks.org/travelling-salesman-problem-set-1/)

        * Graph Coloring
            <font color="green">
                Pseducode

                1. Color first vertex with first color.
                2. Do following for remaining V-1 vertices.
                          a) Consider the currently picked vertex and color it with the 
                             lowest numbered color that has not been used on any previously
                             colored vertices adjacent to it. If all previously used colors 
                             appear on vertices adjacent to v, assign a new color to it.
            </font>

* More

    * NP-completeness

    * use Matrix to solve iteration problem [using matrix and matrix quick power to solve fibonacci](http://blog.csdn.net/nyist_tc_lyq/article/details/52981353)

    * Shuffle algorithm [ref](https://github.com/julycoding/The-Art-Of-Programming-By-July/blob/master/ebook/zh/02.09.md)

    * C++ shuffle and random number [ref](http://en.cppreference.com/w/cpp/algorithm/random_shuffle)

    * Newton's method [ref](https://zh.wikipedia.org/wiki/%E7%89%9B%E9%A1%BF%E6%B3%95)

    * 辗转相除法 求最大公约数(greatest common divisor) 最小公倍数(least common multiple)
        
        <font color="green">
            Pseducode

            int gcd(int n, int m) {
                if(n < m) {
                    int temp = n;
                    n = m;
                    m = temp;
                }
                if(n % m == 0) {
                    return m;
                }else {
                    return gcd(m, n%m);    
                }
            }

            int lcm(int n, int m) {
                return (n * m) / gcd (n, m);
            }
        </font>

    * Bit operation

    <a name="twopointer"></a>
    * two pointer [ref](http://chocoluffy.com/2016/12/04/浅析经典面试算法题-two-pointer的运用/) 

    * Sentinal value [ref](https://en.wikipedia.org/wiki/Sentinel_value)

    * fast pointer and slow pointer

    * Round Robin scheduling

    <a name="typicalsequence"></a>
    * Sequence & String Problem [wikipedia-problem on string](https://en.wikipedia.org/wiki/Category:Problems_on_strings)

        * Stream Parse 
            1. [problem: check if number](https://www.nowcoder.com/practice/6f8c901d091949a5837e24bb82a731f2?tpId=13&tqId=11206&tPage=3&rp=4&ru=%2Fta%2Fcoding-interviews&qru=%2Fta%2Fcoding-interviews%2Fquestion-ranking)
            2. [problem: regular express](https://leetcode.com/problems/regular-expression-matching/description/)
            3. [problem: mini parse](https://leetcode.com/problems/mini-parser/description/)
            4. [leetcode](https://leetcode.com/problems/basic-calculator/description/), [problem: calculator](https://www.zhihu.com/question/62568716)  [code is here](#simplecalculator)

        * Permutation : using trie. [ref](https://github.com/julycoding/The-Art-Of-Programming-By-July/blob/master/ebook/zh/01.06.md)
        
        * Sequence find the top k : BFPRT algorithm, using partition. [tita p112](), [ref](http://blog.csdn.net/acdreamers/article/details/44656295)
            
        * Pattern search 
            0. Trie : **状态转移**
            1. KMP : **减少重复匹配** is a algo to find pattern 'W' in sequence 'S', by using infomation of 'W' itself(present as partial match table or failure function) and the position where dismatch happended. [geek](http://www.geeksforgeeks.org/?p=11902) , [wiki](https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm#KMP_algorithm), [阮一峰](http://www.cnblogs.com/c-cloud/p/3224788.html)
                <font color="green">
                    Pseducode

                    algorithm kmp_search:
                        input:
                            an array of characters, S (the text to be searched)
                            an array of characters, W (the word sought)
                        output:
                            an integer (the zero-based position in S at which W is found 
                                        or -1 when W not found in S)

                        define variables:
                            an integer, m ← 0 (the beginning of the current match in S)
                            an integer, i ← 0 (the position of the current character in W)
                            an array of integers, T (the table, computed elsewhere)

                        while m + i < length(S) do
                            if W[i] = S[m + i] then
                                let i ← i + 1
                                if i = length(W) then
                                    (occurrence found, we may return m or store/use m and prepare for next search)
                                    return m
                                    let m ← m + i - T[i], i ← T[i] (T[length(W)] can't be -1)
                            else
                                if T[i] > -1 then
                                    let m ← m + i - T[i], i ← T[i]
                                else
                                    let m ← m + i + 1, i ← 0
                                
                        (if we reach here, we have searched all of S unsuccessfully)
                        return -1

                    algorithm kmp_table:
                        input:
                            an array of characters, W (the word to be analyzed)
                            an array of integers, T (the table to be filled)
                        output:
                            nothing (but during operation, it populates the table)

                        define variables:
                            an integer, pos ← 1 (the current position we are computing in T)
                            an integer, cnd ← 0 (the zero-based index in W of the next character of the current candidate substring)

                        T[0] = 0        // this is writed by me, more easy to understand
                        for (int i = 1 to sizeof T) {
                            l = 0, r = i, k = 0
                            while (W[++l] == W[++r]) {
                                k++;
                            }
                            T[r] = k
                        }
                </font>

            2. AC 自动机[acautomasion](http://blog.csdn.net/creatorx/article/details/71100840)

        <a name="algo:lcs"></a>
        * Longest Common Substring (suffix tree and DP)

            <font color="green">
            Pseducode
                
                function LCSubstr(S[1..m], T[1..n])
                    L := array(1..m, 1..n)  // L[a][b] means the longest string ended with a, b
                    z := 0
                    ret := {}
                    for i := 1..m
                        for j := 1..n
                            if S[i] == T[j]
                                if i == 1 or j == 1
                                    L[i,j] := 1
                                else
                                    L[i,j] := L[i-1,j-1] + 1
                                if L[i,j] > z
                                    z := L[i,j]
                                    ret := {S[i-z+1..i]}
                                else if L[i,j] == z
                                    ret := ret ∪ {S[i-z+1..i]}
                                else
                                    // nothing
                            else
                                L[i,j] := 0
                    return ret
            </font>

        * Longest Common Subsequence (DP)

            <font color="green">
            Pseducode
                
                // find LCS for str1, str2, ...strn
                dp[a][b][c]...[n] present the length of LCS of str1[0,...a] str2[0,...b]... strn[0,...n] 
                for i equal to 0 to str1.size
                    for j equal to 0 to str2.size
                        ...
                            if str1[a] == str2[b] ==...
                            dp[a][b]... = dp[a-1][b-1].. + 1        // init value is zero "dp[-1][-1] == 0"
                            else
                            dp[a][b]... = max(dp[a-1][b]..., dp[a][b-1]...)
                return dp[str1.size][str2.size]
                
            </font>

        * Longest increasing Subsequence [ref](https://en.wikipedia.org/wiki/Longest_increasing_subsequence)

            <font color="green">
            Pseducode
                
                go through ele in seq :
                    maitain subseq vec for indexed by size of subseq
                    try to create subseq with size equal to vec.back.size + 1
                    go through vec, if ele < last ele of one subseq, substitue it to create a new subseq
            </font>

* Algorithm

    * Problem type

        * a solution is a method or something satisfy problem request
        * Solution found : find out one solution or do one
        * Exhaustive search : find out all available solution
        * Optimal solution : find out the best solution

    * Asymptotic analysis & Complexity & Amortized Analysis
        * [csdn](http://blog.csdn.net/gqtcgq/article/details/45599479)

    * Recursion & Iterate
        a very common one to optimize exponential time recursive algorithms is memorization.

    <a name="divideandconquer"></a>
    * D&C :

        <font color="red">
        0. Classic Problem :
        </font>
        1. Divide is smaller problems are solved recursively; Conquer is the solution to original problem is then formed from the solution to the subproblems

    <a name="dynamicprogramming"></a>
    * DP (top-down & bottom-up) :

        <font color="red">
        0. Classic Problem : [Knapsack problem code](#knapsack),背包问题 [geekforgeeks](http://www.geeksforgeeks.org/dynamic-programming-set-10-0-1-knapsack-problem/) [mit-ref](https://courses.csail.mit.edu/6.006/fall11/rec/rec21_knapsack.pdf), super ugly number.
        </font>
        1. How dp works ? : 
            > When solve no-optimal solution, dp only need to fulfill two attributes [geeksforgeeks](http://www.geeksforgeeks.org/solve-dynamic-programming-problem/) :
            "Optimal substructure" means sub-problem optimal can lead to bigger-problem optimal.
            "Overlapping sub-problem" means you can power the program by records sub-problem answers instead of recalculate it every time.
            >Solve the problem by solve several sub-problem. To power an inefficient program result, by rewriting the recursive algorithm as a nonrecursive algorithm that systematically records answers to sub-problems in a table, called **Tabulation(Bottom up) & Memoization(top down)**
            >In solving "optimal solution", the primative way is 'exhaustive search' and then find the best. But to some problem, we can use DP. In DP, **"Optimal sub-structure"** is not enough to make the 'best global solution', because, we may make later operation for the problem less optimal when we make this sub-problem optimal. SO, **First step**
            > ##### One "State funciton"
            >must be found in this problem, which would deduce 'the solution space for sub-problem' to 'state space of all solution for sub-problem'. Where, all the sub-problem solution which have the same 'state' would have the same affect to 'full scope problem'. Morever, the state function of sub-problem won't be affected when solving a bigger-problem who include it, we called this 'state function' have some
            > ##### '无后效性',
            > 'Forwards Independence'(I only found chinese words).
            In other words, when you want optimal solution of bigger-problem, we won't modify the sub-problem, because, the influence of solutions of sub-problem have be concluded as 'state function'.  **Second step**, we just need to find bigger-problem state from 'small' sub-problem state, which is called
            > ##### 'state transform'.
            > And when you want optimal state, due to 'Forwards Independence', every state is a 'conclution', so, optimal sub-state would leed to optimal global-state, you may get it from optimal sub-problem state or optimal sub-sub-problem. It depends and more complicated in real practice.

    * Greedy :
        <font color="red">
        0. Classic Problem :
        Kruskal's algorithm for minimun spanning tree [ref](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm);  Prim’s Minimum Spanning Tree [ref](https://en.wikipedia.org/wiki/Prim%27s_algorithm);
        Dijkstra's algorithm [ref](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) ;
        Huffman Coding [ref](https://en.wikipedia.org/wiki/Huffman_coding)
        Interval_scheduling [ref](https://en.wikipedia.org/wiki/Interval_scheduling)
        </font>

        1. Solve the "Optimal solution" problem. Greedy algorithm work in phases, in each phases, a decision is made that appear to be good. This problem must have "optimal substructure" and "greedy choice property". In some cases, Greedy won't get the best solution.

    <a name="backtracking"></a>    
    * Backtrack :
        <font color="red">
        0. Classic Problem : print all permutations of a given string [ref](http://www.geeksforgeeks.org/write-a-c-program-to-print-all-permutations-of-a-given-string/) N Queen Problem [ref](http://www.geeksforgeeks.org/backtracking-set-3-n-queen-problem/)
        </font>
        0. In many cases, a backtrack algorithm amounts to a clever implementation of exhaustive search. It usually builds candidates to solution incrementally, and abandons each partial candidate as soon as it determines that candidate has no possibility to become completed solution.
        1. backtracking - all solution - DFS vs branch and bound - one solution - BFS

    * Branch and bound :
        <font color="red">
        0. Classic Problem :
        </font>
        1. is an algorithm design paradigm which is generally used for solving combinatorial optimization problems. These problems typically exponential in terms of time complexity and may require exploring all possible permutations in worst case. Branch and Bound solve these problems relatively quickly.

* Big data 

    * Big number : [csdn](http://blog.csdn.net/gf574723691/article/details/52260158), the idea is simulate the 'algbra multiple process yourself'.

    * inverted index, (倒排索引 ). index data structure storing a mapping from content, such as words or numbers, to its locations in a database file, or in a document or a set of documents (named in contrast to a Forward Index, which maps from documents to content) [wiki](https://en.wikipedia.org/wiki/Inverted_index)

    * Divide & conquer in big data [ref](https://wizardforcel.gitbooks.io/the-art-of-programming-by-july/06.02.html)

    * 外排序 [ref](https://wizardforcel.gitbooks.io/the-art-of-programming-by-july/06.04.html)

    * MapReduce [ref](https://wizardforcel.gitbooks.io/the-art-of-programming-by-july/06.05.html)

    * simhash是google用来处理海量文本去重的算法 : [ref](https://yanyiwu.com/work/2014/01/30/simhash-shi-xian-xiang-jie.html) [ref](https://wizardforcel.gitbooks.io/the-art-of-programming-by-july/06.03.html)
        
    * Bloom filter [ref](https://wizardforcel.gitbooks.io/the-art-of-programming-by-july/06.08.html) [geek](http://www.geeksforgeeks.org/bloom-filters-introduction-and-python-implementation/)

    * Consistent hash [ref](https://wizardforcel.gitbooks.io/the-art-of-programming-by-july/a.3.html)

<a name="Bnetwork"></a>

Computer network(tcp/ip illustrated volume)

* Fundemental : network interface, is something when we talk about multi-sub-network, sub-net & internet or different networks. eg. A router has two or more network interfaces because it links to two or more networks. Any system with multiple interfaces is called multihomed, But a host can not be called router, unless it forwards packets from one interface to another. network interface also may refer to these computer have wifi & Ethernet connection at same time, which doesn't offence the definition above.

* Common Interview Q & A [ref](https://www.nowcoder.com/ta/review-network/review?query=&asc=true&order=&page=2)

* Address :

    * special-use : 
        1. private network => 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16; 
        2. loopback => 127.0.0.1; local-network-broadcast : 255.255.255.255
        3. A class => xx.0.0.0 / 8; B class => xx.xx.0.0 / 16 ; C class => xx.xx.xx.0 / 24

* DNS : 
    * big web run on 1 public ip by load balance [stack](https://superuser.com/questions/936613/how-do-big-websites-such-as-google-com-have-many-web-servers-running-on-1-public)
    * [topdownapproach Figure 2.19 Portion of the hierarchy of DNS servers]()
    * [topdownapproach Figure 2.20 DNS root servers in 2012 (name, organization, location)]()

* Other app-layer :
    0. SMTP (email) 
    1. Telnet (remote terminal access)
    2. FTP (file transfer)
    3. NFS (remote file server)
    4. SNMP (Network mangaement)

<a name="httpdetail"></a>
* HTTP

    <font color="red">
    * Classic Problem : 
        1. state code [ref](https://www.tutorialspoint.com/http/http_status_codes.htm)
            1xx: Informational 
            2xx: Success
            3xx: Redirection
            4xx: Client Error
            5xx: Server Error
        2. http option [ref](https://www.tutorialspoint.com/http/http_requests.htm) 

        3. cookies 
            cookies is a key, assigned by server side, used to identify one client

        4. keep-alive : indicated by "Connection" header

        5. web-cache(proxy) (CDN is based on this feature)

    </font>
    * cgi and fastcgi  [ref](http://www.cnblogs.com/skynet/p/4173450.html)

    * URL need encodeing, so you can find many **'%5B'** like in http

    * keepalive : multiplexing one tcp-connection for multiple http-req-res pair

    * pipeline : don't wait the server to res, continously req few times and then recerve the res together.

    * One http operation can be called as transaction which is consist of divided as following steps :
        * DNS parse -> http request packet -> tcp connection -> receive response

* TCP/UDP

    * tcp vs udp [cdsn](http://blog.csdn.net/li_ning_/article/details/52117463)
        | tcp | udp |
        | -- | -- |
        | based on stream, order and correct gurantee | based on packet no gurantee |
        | based on reliable , 调用listen和accept , 地址信息在connect/accept时确定   | based on packet 在sendto/recvfrom函数中每次均 需指定地址信息 |
        | based on connection, 3 hands , 4 hands | no connection |

        0. TCP :
            ```
            TCP编程的服务器端一般步骤是： 
            　　1. 创建一个socket，用函数socket()； 
            　　2、设置socket属性，用函数setsockopt(); * 可选 
            　　3、绑定IP地址、端口等信息到socket上，用函数bind(); 
            　　4、开启监听，用函数listen()； 
            　　5、接收客户端上来的连接，用函数accept()； 
            　　6、收发数据，用函数send()和recv()，或者read()和write(); 
            　　7、关闭网络连接； 
            　　8、关闭监听； 

            TCP编程的客户端一般步骤是： 
            　　1、创建一个socket，用函数socket()； 
            　　2、设置socket属性，用函数setsockopt();* 可选 
            　　3、绑定IP地址、端口等信息到socket上，用函数bind();* 可选 
            　　4、设置要连接的对方的IP地址和端口等属性； 
            　　5、连接服务器，用函数connect()； // 若不用connect则每次都要指定ip和端口
            　　6、收发数据，用函数send()和recv()，或者read()和write(); 
            　　7、关闭网络连接；
            ```
        1. UDP :
            ```
            与之对应的UDP编程步骤要简单许多，分别如下： 
            　　UDP编程的服务器端一般步骤是： 
            　　1、创建一个socket，用函数socket()； 
            　　2、设置socket属性，用函数setsockopt();* 可选 
            　　3、绑定IP地址、端口等信息到socket上，用函数bind(); 
            　　4、循环接收数据，用函数recvfrom(); 
            　　5、关闭网络连接； 

            UDP编程的客户端一般步骤是： 
            　　1、创建一个socket，用函数socket()； 
            　　2、设置socket属性，用函数setsockopt();* 可选 
            　　3、绑定IP地址、端口等信息到socket上，用函数bind();* 可选 
            　　4、设置对方的IP地址和端口等属性; 
            　　5、发送数据，用函数sendto(); 
            　　6、关闭网络连接；
            ```
    * UDP : unlike TCP, udp don't maintain connection state
    * TCP 
        0. tcp segment structure
            0. sequence number & ack number : RFC793 suggest sequence number is a range of random number based on current time. but still would have 'sequence rollback', which can be handled by 'timestamp'
            1. receive window , let sender know the buffer size of receiver. 
        4. round-trip time (RTT) : which is the time we except it would take for a packet to travel from client to server and then back to the client, it was dynamic calculated by statistic info (the RTT between one packet and ack of it)collected before.
        3. Fast Retransmit, sender would retransmit when receive three 'dup ack'. when lost packet receiver would send simply reacknowl- edges (that is, generates a duplicate ACK for) the last in-order byte of data it has received. 
        2. some tcp protocol implement a 'select retransmit' instead of 'go back n', which would let sender only retransmit the missing one not all packet after missing one.
        1. TCP is based on sender buffer, receive buffer, (congestion window later)[topdownapproch Figure 3.19] [cisco](https://wizardforcel.gitbooks.io/network-basic/content/7.html)
        0. connection management , state graph, 3 hands connect, 4 hands close. [TLPI Figure 61-4](), [topdownapproch Figure 3.42]() 
        5. TCP congestion-control ,  [cisco](https://wizardforcel.gitbooks.io/network-basic/content/10.html)
            1. slow start [topdownapproch Figure 3.51](), window start at 1 MSS , add 1 more MSS when every ack of this MSS is received( looks like duplicate if all is received ), before 'ssthresh'. 
            2. congestion avoid , add one MSS before congestion. 'ssthresh' = cur window / 2, when detect congestion( three dup-acks )
            3. fast recovery , window = 1 MSS, go to slow start
            4. all in one[topdownapproch Figure 3.53]()
    <font color="red">
    * Classic Problem : 
        3. Why TIME_WAIT, [ref](http://www.firefoxbug.com/index.php/archives/2795/) (1) 保证新tcp连接和老tcp连接不会干扰,让其在2 * MSL 中消失 (2) 确保"主动关闭"端最后发出的 ACK 到达"被动关闭"端
        1. a socket have two way connection, a connection is identified by five eles(udp/tcp flag , src ip, des ip, src port, des port)
        3. delay ack is implement to 'let small packet less in network' by wait a response packet and stick to this 'res'.
        5. maximum segment size (MSS). The MSS is typically set by first determining the length of the largest link-layer frame that can be sent by the local sending host(the so-called maximum transmission unit, MTU), and then setting the MSS to ensure that a TCP segment (when encapsulated in an IP datagram) plus the TCP/IP header length (typically 40 bytes) will fit into a single link-layer frame.
        4. [Nagel](#Nagel) solve the problem 'too many small packet' may cause delay.
    </font>

    * shutdown vs close : [ref](https://stackoverflow.com/questions/9819745/how-tcp-stack-distinguish-close-and-shutdown)

    * RST flag : a device will send a RST is in response to receiving a packet for a closed socket or non-open socket, would cause EPOLLERR [when would RST happen](https://my.oschina.net/costaxu/blog/127394)

    * 短 & 长 connection :
    "non-persistent" connection: that is, one connection per request.
    "persistent" connection: that is, for one tcp connection, there could be multi request one by one.

* IP, a best effort protocol

    * VLAN [cisco](https://wizardforcel.gitbooks.io/network-basic/content/2.html)
    * Router [cisco](https://wizardforcel.gitbooks.io/network-basic/content/3.html)
    <font color="red">
    * Classic Problem : 
    1. IP header format at[topdownapproch Figure 4.13]
        1. TTL : The time-to-live (TTL) field is included to ensure that datagrams do not circulate forever (due to, for example, a long-lived routing loop) in the network.
        2. fragment/reassemble[topdownapproch Figure 4.14]() 
        3. MSL (Maximum Segment Lifetime), is the time a TCP segment can exist in the internetwork system.
    2. IP-address
        0. Interface : The boundary between the host and the physical link is called an interface, An host can have many Interface, thus many IP address
        1. subnet : determine subnet [topdownapproch p341]()
        2. Dynamic Host Configu- ration Protocol (DHCP) [RFC 2131]. DHCP allows a host to obtain (be allocated) an IP address automatically
    3. Protocol multiplex/demultiplex [topdownapproch p191]
    4. Internet Control Management Protocol (ICMP) : ping: ICMP的ping请求数据报在每经过一个路由器的时候，路由器都会把自己的ip放到该数 据报中。而目的主机则会把这个ip列表复制到回应icmp数据包中发回给主机; traceroute :首先给目的主机发送一个TTL=1（还记得TTL是什么吗？）的UDP(后面就 知道UDP是什么了)数据包，而经过的第一个路由器收到这个数据包以后，就自动把TTL减1，而TTL变为0以后，路由器就把这个包给抛弃了，并同时产生 一个主机不可达的ICMP数据报给主机。主机收到这个数据报以后再发一个TTL=2的UDP数据报给目的主机，然后刺激第二个路由器给主机发ICMP数据 报。如此往复直到到达目的主机。这样，traceroute就拿到了所有的路由器ip。从而避开了ip头只能记录有限路由IP的问题。 [topdownapproch Figure 4.23]()
    5. Internet Group Management Protocol (IGMP) which is used to manage a host’s joining and leaving of multicast groups, was previously a separate protocol from ICMP in IPv4.
    6. Routing : 
        1. RIP & OSPF & BGP routing
        2. routing table 
    </font>

* ARP
    * Address Resolution Protocol (ARP) [topdownapproch p465]
    * ARP 在 tcp/ip 里被看做网络层

* VPN :
    0. PPTP : point to point
    1. L2TP : link layer
    3. IPsec : network layer
    4. SOCK v5 :app layer


<a name="Cccarg"></a>

# Computer architecture(Computer architecture & csapp 1~9, the rest chapters will be included in system program)

* CPU architecture
    1. 'words' == cpu bits
    2. Y86 programmer-visible state. [csapp Figure 4.1]
    3. TODO

* Machine-Level Representation of Programs
    1. register [csapp Figure 3.2]() and assembly

        | item | usage |
        | --- | --- |
        | condition code register | hold most recently arithmetic or logical instruction state |
        | 'pc' eip | point to next instruction to be executed |
        | integer register file | contains eight named locations storeing int(or address) |
        | esp | 'stack pointer'(address) point to stack top |
        | ebp | 'frame pointer' to help access stack, (usually point to function invoke position)|
        | eax | accumulator, default register for 'ADD' |
        | ebx | base address which would be do with 'offset' |
        | ecx | counter, used for 'LOOP' |
        | edx | used to store remaining as integer dividing |
        | esi | the source address |
        | edi | the dest address |
        | floating register | store floating data |

    2. assembly for printf, 函数右入栈是为了可变参数 [csdn](http://blog.csdn.net/csujiangyu/article/details/44002507)

* Memory Hierarchy

    * Cache : CPU cache, [write cache friendly code](http://stackoverflow.com/questions/16699247/what-is-cache-friendly-code) I also have one pdf named **What every programmer should know about memory**

* Linker and compile
    * Linux use the standard ELF Object files format
        0. Relocatable object file [CSAPP Figure 7.3, Typical ELF relocatable object file](), Problem=do bss segment affect the size of ELF file on the desk? Answer=bss segment won't occupy any room.
        1. Executable object file
        2. Shared object file
    * Symbol table : each relocatable object has a symbol table
    * Symbol Resolution : make symbol definition exclusive
    * Relocation : Merge object files and assign run-time address
    * Loading excutable & link with shared libraies

* Exceptional control flow

* Virtual Memory

    * Foundamental Concept : Main memory(RAM); MMU(Memory management unit); PT(page table); PTE(page table entry) is entries of table; VPs(virtual pages); PPs(physical pages);

    * Purpose of VM

        1. As caching tool
             1. ***three state of page*** -- unallocated, uncached, cached;
             2. ***when gonna get some page, there could be three state*** -- Page hit; Page fault; Thrashing, page are swapped in and out continuously, which are not **efficient**.
             3. ***the efficient of virtual memory is fine***. Because, most of time, kernel just work on a smaller set of **active page** known as **resident set** or **working set**, this kind of paging method is called **demand paging** and used every OS.

        2. As memory management tool

            In fact OS provide separate page table(virtual address spaces) for each process, which is essential for further feature like :
            linking & loading & dynamical library loading & shared memory & memory allocation;

        3. As memory protection tool

            Some information is set for one PTE that indicates the rights or privilage.

    * Real Example : [csapp' Figure 9.22]()
        0. MMU and address Translation, all is about efficient
            1. TLB(translation lookaside buffer), [csapp Figure 9.15]()
            2. Multi-level page tables['csapp-Figure 9.18']()

        1. the format of PTE [csapp Figure 9.24]()

            | item in PTE | usage |
            | ----- | --- |
            | dirty bits | tells kernel whether or not it must write-back a victim page before it copies in a replacement page |
            | xxothers | xx |

    <a name="os:virtualmemory"></a>
    * Linux Virtual Memory System : 

        1. [caspp-Figure 9.26]() : linux maitains a seperate virtual address space for each process of this form. shared obj is located upon heap.
            1. **segments** : is a contiguous chunk of allocated virtual memory(data segment etc.)
            2. **kernel VM** : there are process-different area and process-identical area
        2. [csapp-Figure 9.27]() : how linux maintains virtual memory : 
            1. **task struct :** kernel maintains a distinct task structure handles all information needs to run a process(e.g., PID, stack pointer, program counter), here two fields of interest to us named **pgd** and **mmap**, *pgd* points to the base of level1 page table (page global directory), *mmap* points to a list which characterizes current virtual address space. 
            2. **Memory Mapping** is the process to initializes the contents of a virtual memory area by associating it with an object on desk(or memory block of others). Once a virtual page is initialized, it is swapped back and forth between a special **swap file**. The idea of memory mapping resulted from a clever insight that if the virtual memory system could be integrated into the conventional file system, then it would **provide simple and efficient way to load programs and data into memory**, 
            3. MMU's page fault would cause **kernel page fault handling**, which is consist of three steps,(1) is virtual address legal (2) process permission (3) select and(swap out if page is dirty) swap in, and restart MMU.

        <a name="os:copyonwrite"></a>
        3. ['csapp Figure 9.29']() : technics that linux use
            1. **Shared object** is mapped into both VM, and can be seen by both and data written will reflect to both. Dynamic library(shared library) is one special case of 'memory-mapped files'.
            2. **Private object** is **copy-on-write**[csapp Figure 9.30], which means this object is like shared object, until written, when written, a new PM page would be mapped to written VM page to store the change. 
        4. ***fork() revisit***, when fork(), kernel only copy the metadata of process, and set copy-on-write for these data. 
        5. ***execve() revisit***, (1) global metadata (2) segment metadata (3) mapping shared memo (4) set PC (5) start at the addr that PC point
        6. ***mmap() revisit*** mostly used as two purpose (1) map executable image (2) shared between process

    * Implict and explict Dynamic Memory Allocation

        0. **two kinds of allocator**

            | Explicit allocator| Implicit allocator|
            |-| -|
            | require the app to explicitly free allocated blocks. like c++/c | require allocator to detect when an allocated block is no longer needed, which is known as garbage collectors. like Java |

        0. **problem when implement (explicit) allocator**

            1. **fragment**, occurses when unused memory is not available to satisfy allocate requests; **internal fragmentation** is to allocate block is larger than payload(payload is allocated memo + metadata memo + alignment memo).  3. **external fragmentation** is free memory is one piece by one piece. 
            2. Free block organization : How do we keep track of free blocks? [csapp Figure 9.36 Organizing the heap with an implicit free list]()
            3. Placement : How do we choose an appropriate free block in which to place a newly allocated block? 
                0. Some common policies are first fit, next fit, and best fit.
            4. Splitting : After we place a newly allocated block in some free block, what do we do with the remainder of the free block?
                0. the allocator will usually opt to split the free block into two parts, to get the smallest size bigger than required.
            <a name="coalescing"></a>
            5. Coalescing : What do we do with a block that has just been freed? [csapp Figure 9.40 Coalescing with boundary tags.]
            6. a Simple Allocator [csapp p827]()
            7. Other technic

    * Physic Memory run-time, used, free, shared, buffer, cache : [ref](http://serverfault.com/questions/85470/meaning-of-the-buffers-cache-line-in-the-output-of-free) In RAM, for every page size memo, there are five state.
        1. ***used***, means used, not free. 
        2. ***free***, pure free and untouched. 
        3. ***shared***, used for shared memo by multiple process. 
        4. ***buffers***, file system metadata, speed up somexxxx?. 
        5. ***chche***, for help kernel to speed up OS operations, pages with actual contents.

    * Garbage Collection
            0. ***garbage collector :*** view of memory as a directed graph[csapp-Figure 9.49]() marked all nodes reachable, and swep unreachable nodes.
            1. comparing to JAVA, c/c++ collectors are regarded as conservative garbage collectors. They are conservative in the sense that each reachable block is correctly identified as reachable, while some unreachable nodes might be incor- rectly identified as reachable.  

    <font color="red">
    * Classic Problem : 
        * slab vs slub, they are both an memory allocator, which is a part of linux kernel library. [ref](http://events.linuxfoundation.org/images/stories/pdf/klf2012_kim.pdf)
        * Buddy,伙伴算法管理内存，其思想是：把内存块分成不同的组(1,2,4,8,16,32....)；分配内存时找到能够满足条件 的最小的块；如果找不到，就找大的块，然后一分为2，分配一块，留一块；回收时：如果有相邻的同样大小的块，则合并 [check](#coalescing)
    </font>

<a name="Doperatingsystem"></a>

# Operating system & system programming(TLPI & AUPE & ModernOS)

Book Abbreviation and Full Name: TLPI(The Linux Program Interface), AUPE(Adavance Unix Program Environment), MOS(Modern Operating System)

* Fundamental

    * System call : system call is implement by kernel with a interface defined by POSIX, like C-standard library. What is tricky is that these function in c-standard library have the same name of 'real system call' and also reffered directly  'system call'. open() is a 'system call', fopen() is a 'library call'.

    * Atomicity : An uninterruptible step, which is a necessary requirement for correct operation of many system calls. Kernel guarantees that all of the steps in a system call are completed as a single operation.
        <font color="red"> Read more about "Concurrency programming" </font>

    * Structure of the Linux kernel [MOS Figure 10-3]()

* Signal 

    <a name="signalfd"></a>
    * Signal fd [TLPI p472]()

    * Signal : **Following signal should be your awareness**
        <a name="signal:EINTR"></a>
        1. EINTR [ref](https://stackoverflow.com/questions/1674162/how-to-handle-eintr-interrupted-system-call) [robust io](#io:robust)

* I/O

    * Fundamental
        1. Universal operation : open() read() write() close(), 'file offset' lseek(), which are defined in <unistd.h>. In Unix world, everything is file(or psudo file).
        2. I/O Hardware :
            1. block devices -> disk -> **fixed-size block**
            2. character devices -> printer, network -> **stream data**
        3. File descriptor : the per-process file descriptor table -> system-wide table of open file description -> the file system i-node table. [tlpi page 95](), fd and i-node table [MOS Figure 10-34]()

    * Buffering :
        1. kernel buffer : read() write() only simply copy data between a user-space buffer and a buffer in the kernel called **'buffer cache' or 'kernel buffer'**. U can find API to control kernel buffering in <unistd.h>.
        2. user buffer : If you just use read() without own buffer modify, U would enter kernel mode every time you invoke read(), which is **noefficient**. Use larger buffer, when working with large data. There are some function about buffer in stdio.
        3. Asynchronism attribute of i/o : write() invoke is nonblocking asynchronism, sometime you should force flushing of kernel buffers for outputs files, to ensure that output really has been written to the disk.
        4. Direct I/O (with O_DIRECT flags when open()): useful for bypassing kernel buffering in certain circumstances. But using Direct I/O would lose kernel optimization on I/O, and need to care about alignment and block size(physical block size of device, typically 512 bytes) 
        <font color="red"> Read more about "network programming" </font>

    * Detail

        <a name="io:robust"></a>
        1. Robust : I/O operation can be signal interrupted, [stack overflow](https://stackoverflow.com/questions/1674162/how-to-handle-eintr-interrupted-system-call)
        [every blocking operation should be aware of EINTR](#signal:EINTR), so, if was, re-excuting it is an require for robust i/o

                // you can define a robust buffered io as following, check the implementation of csapp :
                // this implementation just gurantee buffered, robust semantic should be done with signal handle
                    typedef struct rio {
                        int rio_fd_;
                        char rio_buffer_[];
                        int rio_unread_number_;
                        char* rio_next_unread_p_;
                    }rio;

        2. Ownership : use flags to make open() return an error if the file already exist, which makes process to ensure that it's the creator of a file.

        3. Zero Copy for socket : why? usually, OS would copy data from user buffer to socket buffer, even need a page copy from page cache. This tech is essential for io-matters task. Zero copy can be achived with 'sendfile()' system call [check c10k](#io:c10k)

        4. COW ( copy on write ),[check OS level](#os:copyonwrite). You can also provide app level COW, which needs you to set a **'write guard bits'**.

    <a name="io:nonblocking"></a>
    * Nonblocking I/O 
        1. nonblocking is that If an I/O operation can't be done immediately, it would return an error instead of blocking. 

    * Multiplexing is a way to handle i/o which differs traditional way (a process performs I/O on one file descriptor at a time ) like poll() & select().& epoll
        0. Perform comparison : [select & poll vs epoll](http://www.cnblogs.com/Anker/p/3265058.html)
        1. signal-driven I/O is better performance than poll() when monitoring large numbers of fd, but hard to use. 
        2. epoll() is like poll() but have the performance like signal-driven I/O.
        3. How epoll and select is implemented ? Each socket have a list of waiter, which is called 'struct wait_queue_head_t'. [quara](https://www.quora.com/Network-Programming-How-is-epoll-implemented)

            | select & poll | epoll | item |
            |-------|--|--|
            | the set of event fds only exist one invoke | create a epollfd to aggregate event fds| event fds |
            | loop through fds and check if event already happen, if not then insert event handle into fd's 'wait_queue_head_t', which would cause thread sleeping inside the 'select()' to wake up. When return, remove these event handle from 'queue' | epollfd keep track of event fds in red_black_tree, and a list for active fds, when waked by socket fd like select do, epoll would add this socket fd into 'active list' then notify us | how works |
            | needs to loop over all fds O(n) | entirely event-based and long-last set and ready list O(1) | time complexity |
            
* File system

    * Concept : 
        1. Device file: chracter file vs block file, 
        2. Disk and partition, : Each partition is treated by the kernel as a separate device residing under the /dev directory.
        3. File system : [TLPI Figure 14-1: Layout of disk partitions and a file system](), 
        4. I-node, A file system’s i-node table contains one i-node (short for index node) for each file residing in the file system. [TLPI Figure 14-2: Structure of file blocks for a file in an ext2 file system](). as stated, ext2 use data block pointer.
        5. Virtual File System : you can have multiple file system under VFS and using them through VFS, 
        6. Single Directory Hierarchy & Mount Points : other file system can mount as a device [TLPI Figure 14-4: Example directory hierarchy showing file-system mount points], 
        7. RAID [MOS p371]() Redundant Array of Inexpensive Disks
        8. IO scheduler [MOS p780]() : (0) Normal disk operation, sorted in double linked list ordered by address (1) raw block files, used to work around with file system, often used for paging. (2) line discipline, used with terminal. (3) network devices, .
        9. IO schedule algorithm, [ref](http://www.cnblogs.com/cutepig/p/3403711.html)

    * [MOS Figure 10-22. The Linux I/O system showing one file system in detail]

    * NFS [the network file system 'MOS' p792]()

    <font color="red">

    * Classic Problem : 
        * VFS结构，[The Linux Virtual File System 'MOS' p784 Figure 10-30. File-system abstractions supported by the VFS.]() 
        * file with inode . [TLPI Figure 18-1: Relationship between i-node and directory structures for the file /etc/passwd]()
        * soft link and hard link with inode,[TLPI Figure 18-2: Representation of hard and symbolic links] 
        * 文件缓存，Since directories are searched linearly, it can take a long time to find an entry at the end of a large directory. Therefore, the system maintains a cache of recently accessed directories. [MOS p787]()
        * io调度 [MOS p773]()
    </font>

* Memory

    * virtual memory [duplacated ](#os:virtualmemory)

* Process

    * Fundamental :

        * User space vs kernel space : a process run either in user space with normal priviledges or kernelrun in kernel space on behalf of that process, with all priviledges. Kernel space is the top 1GB in virtual memory address map.

        * Kernel maitains a **process table** with one entry per process also called as PCB (process control block) [MOS Figure 2-4 Some of the fields of a typical process-table entry](), Kernel also maintains a **interrupt vector** for each I/O class, which would interrupt process.

        * Linux process concept : parent process -> child process -> process id -> pipes (write stream) -> signal(send to process) -> process group -> zoombie process (a child has finish excute and wait for parent to read it's exit state in PCB) -> orphan process ( a child whose parent can't read it's exit, would be adopted by 'init' ) -> linux kernel represent thread and process as **task**(by the PCB) who has the name because in source code, it was named as (PCB in source code)**task_struct** [also see csapp Figure 9.27]() -> [MOS Figure 10-8. The steps in executing the command ls typed to the shell.]()

    * Process and thread memory [duplacated but still put it here](#os:virtualmemory)

    * How to create deamon process : a daemon process must be isolated with parent process and session. [deamon](http://alfred-sun.github.io/blog/2015/06/18/daemon-implementation/)

    * thread vs process : 
        0. the linux thread model is NPTL [Native POSIX Thread Library](https://en.wikipedia.org/wiki/Native_POSIX_Thread_Library) which would copy parent stack[quote](#https://stackoverflow.com/questions/43136881/what-is-the-relationship-between-a-thread-and-its-parent-stack).
        1. at the aspect of linux kernel, they are almost the same(linux uses 'task_struct' to represent any execution context). The thread module in linux is 1 - 1 module, which means that one kernel task is a thread, also a process.  The only different is thread share the same virtual memory address space. So, the low system interface to create threads is 'clone() or sys_clone()'(which blurred the distinction between process and thread, and this clone also specified the memory thread private stack is allocated) where higher level of posix standard is 'pthread_create'
        2. the infomation 'task_struct' hold can be described as follows : (1) Scheduling parameter (2) Memory image (3) signal (4) machine register (5) system call state (6) file descriptor table (7) Accounting(cpu time may use and others) (8) kernel stack (9) Miscellaneous (PID etc) ; [MOS Figure 10-8 the steps in executing the command ls]()
        3. context swithing for process vs thread [stack](https://stackoverflow.com/question/7439608/step-in-context-switching)
        4. comparison 
            | process | thread | item |
            | ------- | ------- | ------- |
            | resource container and program entry| execution unit | resource container and excution unit|
            | shared or mapping only memory image between processes | shared everything but excution stuff(stack and register) | shared things |
            | hard to create and switch | easy to create and switch | schedule overhead |
            | IPC | directly by memory | communication|
            | no race no need for sync | hard to sync | race condition & sync |
            | process is easier to cross machine | thread is hard to cross machine | live migration |

    * Task manage & schedule

        0. kernel task state : [MOS Figure 2-2](), **Runing**, **Blocked**, **Ready**
        1. scheduler : 
            1. when to happen [book-MOS p152](), what's nonpreemptive scheduling & preemptive scheduling, 
            2. linux Linux distinguishes three classes of threads for scheduling purposes: 1. Real-time FIFO.  2. Real-time round robin.  3. Timesharing. [MOS p746]()
            3. O(1) scheduler, idea is 'to get process out of CPU as fast as possible', CFS [book-MOS Figure 10-10]. 
            <a name="os:cfs"></a>
            4. The main idea behind **CFS scheduler** is to use a red-black tree as the runqueue data structure. Tasks are ordered in the tree based on the amount of virtual time they spend running on the CPU, called vruntime, which is calculated by their weight to all processes' weight ratio. [csdn](http://blog.csdn.net/fangjian1204/article/details/39736725)
        3. cpu schedule algorithm [geek](http://www.geeksforgeeks.org/gate-notes-operating-system-process-scheduling/)
        2. threads in User space & kernel space (linux thread is kernel space)
        3. Synchronization in Linux [MOS p750](), [read about concurrent](#pthread:im)

    <font color="red">
    * Classic Problem : 
        0. problem : The Dining Philosopher Problem
        1. 进程调度，
        2. 进程生命周期，
        3. CFS调度算法，[check below](#os:cfs) 
    </font>

* IPC(only POSIX IPC here)

    * Pipe versus message queue : [ref](http://stackoverflow.com/questions/3501458/pipe-vs-msg-queue)

    * Pipe :
    used in shell, pass data between "related" process. Pipe is actually a byte stream. (pipe(filedes) returns two open file descriptors in array filedes, one for write, one for read)

    * FIFOs :
    a variation of pipe concept, which can pass data between any process. (mkfifo(const char* pathname, mode_t mode) to create FIFO

    * Message queue :
    allow processes to exchange data in form of messages, would least after process end.(mq_open() to creates a new message queue or obtains an existing queue) **They are fast and easy to use.** MQ is just a mapped memory shared, and handle read write by kernel. The best feature of it is that it can last even when process has died.

    * Semaphore :
    don't use it to transfer data. They allow processes to synchronize their action (access to a block of shared memory). Actually, semaphore is a kernel-maintained integer whose value is restricted to being greater than or equal to zero. (sem_open() API to create a new semaphore). **Problem=can you use semaphore to implement producer consumer module ? Answer=Yes, just add 1 when produce and minus 1 when consume**(unlike mutex, semaphore can have more than '1 & 0')

    * Signal :
    Signal programming is cumbersome and difficult when comparing with other IPC, so, don't use signal as IPC until you must.
<font color="red">
You should avoid any signal-based design in your code as possible. It's might good for OS but very unclean approach for app. Signals can get lost, signal handles operate in strange context and shouldn't do very much, and it's all around an ugly design.
</font>

    * Unix domain sockets :
    [ref](https://stackoverflow.com/questions/2281204/which-linux-ipc-technique-to-use), client and server must bind the the same domain socket 'id'(a tmp file name would careated by bind operation).

    * Shared memory :
    allows multiple processes to share the same region(shm_open() to creates a new shared memory segment or obtains an existing segment), default max size is 32 MB, can be easily changed.

    * Related topics : [Socket,](#H) [RPC,](#F) not include here

* DeadLocks

    * Fundamental : Resources, preemptable resource & nonpreemptable resource, require resource, use resource, release resource. DeadLock,  a set of processes is deadlocked if each process in the set is waiting for an event that only another process in the set can cause. In most time, kernel handle deadlock by checking and erase deadlock for you if your program didn't have big error(循环等待系统内核检测不到的资源，如前面所说).

    * Resource trajectories graph [book-MOS p451]()

    * Avoid deadlock in cpp [cppconcurrencyinaction c3.2.4]()
        
    * Solve
    
    <font color="red" size="3">
    * classic problem :
        1. 银行家算法:所谓银行家算法，是指在分配资源之前先看清楚，资源分配后是否会导致系统死锁。如果会死锁，则不分配，否则就分配。
    </font>

* Multiple Processor Systems

    * There could be three kind of this MPS(multiple processor system) book-MOS p519, A. Shared-memory multiprocessor B. Message-passing multi computer C. Wide area distributed system. So generally speaking, a ditributed system can be called as MPS.

    * Multiprocessor

        * multoprocessor hardware : UMA(uniform Memory access), multicore chip, NUMA(Nonuni-form Memory Access)
            1. UMA
            2. NUMA, [MOS p525](), TODO

        * programming with it : the hardware is way ahead of the software, while multicore chips are here now, our ability to write application for them is not. That means, this area is scarcing on the ground.

        * Other topic : you don't need know this, if you do, check book-MOS chapter 8

    * Multicomputer

        * RPC (remote procedure call) : check the module graph at book-MOS p557, it actually implement a 'server stub' which hide the fact that the procedure call from the client to the server is not local.

        * some topic optional to know : Low-level communication software, RDMA (remote direct memory access), User-level communication software, DSM (distributed shared memory)

    * Distributed system : [Check Topic,](#F)

* Other & question

    * Time Granularity

    <a name="ref:blockingandschedule"></a>
    * schedule and blocking call : [ref](https://www.quora.com/What-happens-to-a-process-after-a-blocking-system-call-Is-another-process-scheduled-immediately-or-only-after-its-time-quantum-elapses)

<a name="Econcurrency"></a>

# Concurrency Programming & Network Programming in Practice (Socket & MIT-6.033 & chenshuo book)

* Overview

    * Concurrency pattern : [ref, see buttom of this page, find more](https://en.wikipedia.org/wiki/Concurrency_pattern) , [ACE paper for patterns of concurrent, parallel and Distributed system](www.cs.wustl.edu/~schmidt/patterns-ace.html)

    * Model
        * Two main approach to support highly concurrent situation in practice : 
            1. **Reactor, Proactor**, using kernel IO multiplexing
            2. **Goroutine like**, using user coroutine
        * Actor model may be the best model to design concurrent programes. reactor & proactor & Goroutine like are patterns to do concurrent technically, actor or active obejct is patterns to design concurrent program. [actor vs active object : they only have subtle difference](http://members.unine.ch/anita.sobe/res/RR-I-AS-2014.06.1.pdf) ; The Active Object design pattern **decouples** method execution from method invocation to enhance concurrency and simplify synchronized access to an object that resides in its own thread of control.
        * Reactor (using schedule and IO multiplexing) vs Proactor [one paper which express it clearly, keep it easy, not long](www.cs.wustl.edu/~schmidt/PDF/proactor.pdf) 

    * **Asynchronism & Synchronism** :
    this two concept is applied to caller and callee in one function call/ interface/ routine, which would return a result.
    Synchronism is the result of this operation is done and then returned to caller, at the place caller make this operation.
    Asynchronism is result is not returned to caller at that place, instead, result may return by pushing or asking while and operation arguments may remain in a buffer for callee when caller do the next operation. (Asynchronism can be done by many ways, OS manage I/O with interrupt and DMA(DMA is better than interrupt), framework manage API with timer or tools from below API)

    * **Blocking & NonBlocking** : this two concept is applied to callee. Every operation can be divided into two categories. (about blocking and scheduling check [this](#ref:blockingandschedule)) [io:nonblocking](#io:nonblocking)
    1->can be done now
    2->can't be done now
    If one function call/ interface/ routine returned fail when can't be done, it's nonblocking.
    If one f/i/r waited until can be done dan return true, it's blocking
    Note that : although asynchronism f/i/r need nonblocking(a blocked operation would break the asynchronism's never idle hypothesis), it didn't mean that nonblocking == asynchronism.

    * **Corutine & async await**
        1. a simple corutine implement using C 'goto' (达夫设备 就是goto) to illustrate the core technic of corutine. ( this is called hack ) [ref](https://en.wikipedia.org/wiki/Duff%27s_device) [ref](https://github.com/benhoyt/protothreads-cpp/blob/master/Protothread.h)
        2. comparison of two [zhihu](https://www.zhihu.com/question/65647171)

    * **subroutine routine vs coroutine continuation**
        1. four are concept when talk about program flow.
        2. subroutine and routine is based on stack and invoke, invoker is routine, invokee is subroutine.
        3. continuation : 可以理解为让我们的程序可以暂停，然后下次调用继续（contine）从上次暂停的地方开始的一种机制,相当于程序调用多了一种入口(另一个是invoke)。
        4. Coroutine : a concept depends on continuation, support operation like : yield, resume
        5. GreenThread : GreenThread is a defined object in user space to simulate the thread situation to support the operation of coroutine. Goroutine is a implement of GreenThread.
        6. Fiber : the instance when coroutine/GreenThread runs, is a fiber.
        7. 非对称的协程有调度，对称的没有调度。

* Unordered Concept

    * web application framework : 1. request/response abstraction 2. session state. 3. user authentication and authorization 4. page templating 5. URL mapping 6. database access 7. web security
    
    * one event-loop per thread (Reactor on each thread)

    * Blocking queue : a queue with two additional operation 1. block dequeue thread when queue is empty 2. block enqueue thread when queue is full

    * Producers & consumer mode --- usually used with blocking queue

    * TaskQueue

    * thread pool

    * Half-Sync/Half-Async : when you find some performance bottleneck, you should consider add some async-code into your sync-code.

    * In muduo library, what chenshuo recommand is one loop per thread + thread pool
    * Granularity of critical zone is important for concurrency potential of a program.

* technic: 

    * GuideLine : 1. There are many different technic in this area, you should choose the right one by tradeoff between atomic vs visible, security vs efficent.
                1. If you can choose, avoid to use thread-cross shared object, using creater-consumer, Pipeline, task queue would make you easy. That is using message passing model instead of shared memory model.

    * Atomic operation & lock free data structure
        1. a good example write read lock implemented by atomic operation, (protect critical zone by spin) [code here](#writereadlockbyatomic)
        2. a example to implement spinlock [code slide](#spinlock)
        3. memory barrier: As we know that the CPU reordering (different from compiler optimisations) would let our instruction unordered, this **set of assembly instruction** is used to gurantee the cpu order.
        4. Memory order [zhihu](https://www.zhihu.com/question/24301047)
        5. live lock : A live lock occurs when two threads each try to change the data structure, but for each thread the changes made by the other require the operation to be restarted, so both threads loop and try again.  Imagine two people trying to go through a narrow gap. If they both go at once, they get stuck, so they have to come out and try again. 
        6. a example of lock-free stack, with bugs [code slide](#lockfreestack)
        7. a example of lock-free queue, with bugs [code slide](#lockfreequeue)

    * Pitfall
        1. Spurious wakeup [ref](http://stackoverflow.com/questions/8594591/why-does-pthread-cond-wait-have-spurious-wakeups)
            because spurious wakeup may make cond.wait() returned but logicly something we want wait for is not fulfilled, that wanted thing can be expressed as boolean.
            ```cpp
            //so, we should use code like this :
                    while (boolean) {
                        cond.wait();
                    }
            //in stead of this :
                    if (boolean) {
                        cond.wait();
                    }
            ```

    <a name="pthread:im"></a>
    * pthread provides us 
        
        1. Mutex（互斥量）：pthread_mutex_*** 从实现原理上来讲，Mutex属于sleep-waiting类型的锁。例如在一个双核的机器上有两个线程(线程A和线程B)，它们分别运行在Core0和Core1上。假设线程A想要通过pthread_mutex_lock操作去得到一个临界区的锁，而此时这个锁正被线程B所持有，那么线程A就会被阻塞(blocking)，Core0 会在此时进行上下文切换(Context Switch)将线程A置于等待队列中，此时Core0就可以运行其他的任务(例如另一个线程C)而不必进行忙等待。
            1. how did mutex work? implement by CPU instruction 'lock and exchange', to set a flag.[ref , Greg Hewgill said](https://stackoverflow.com/questions/11770571/how-do-mutexes-really-work)
        2. Condition Variable（条件变量）：pthread_con_***
        3. Read/Write lock（读写锁）：pthread_rwlock_***
            1. Shared_mutex & read-write lock[ref](https://stackoverflow.com/questions/12033188/how-would-you-implement-your-own-reader-writer-lock-in-c11)
        4. Spin lock（自旋锁）：pthread_spin_*** 而Spin lock则不然，它属于busy-waiting类型的锁，如果线程A是使用pthread_spin_lock操作去请求锁，那么线程A就会一直在 Core0上进行忙等待并不停的进行锁请求，直到得到这个锁为止。 [code slide](#spinlock)

* Virtualiation and the cloud : check it at chapter [others](#Z)

<a name="Fuckdistributed"></a>

# Distributed system(MIT-6.824)

* Large-scale distributed telecommunication design pattern [ref](www.cs.wustl.edu/~schmidt/patterns-ace.html) book- Pattern Oriented Software Architecture : Patterns for Concurrent and Networked Objects

* Fundamental concept : book-MOS p566

    * (Http)Web service : most web server are http servers, they are used to support web pages/ web sites/ web service, which are the corresponse method to serve user/ user/ program.  particularly, web service api reference the user interface exposed by a distributed infomation group.

    * PRC [mit course note ](http://nil.csail.mit.edu/6.824/2015/notes/l-rpc.txt)
        1. RPC ideally makes net communication look just like fn call:

       <font color="green">
            Pseducode

              Client:
                z = fn(x, y)
              Server:
              fn(x, y) {
                  compute
                  return z
              }
        </font>
        1. at most once behavior 
      RPC aims for this level of transparency

    * Web service vs RPC : they are both build on computer network + app protocol + serilize method + logic themself
        1. Web service is focus on "Resource", so it play well with 'REST' [check here](#restful), and 'Http' [check here](#httpdetail)
        2. RPC is more powerful and more complicated which is can be built on 
            1. app protocol : http, tcp, binary bits
            2. logic : sync & async
            3. seriliza method : protolbuf, json

    * Distributed system is one in which components located at networked computers communicate and coordinate their actions only by passing messages.

    * Middleware model : compare to FTP, telnet, ssh, www, they all reinvent their wheel to doing things, DS (distributed system) add some common paradigm model to internetwork communication, for one goal, by a loosely connected bunch of machines. So, we would do this by add a layer of software on top of OS, called middle-ware, toallow processes and users on far-flung machines to interoperate in consistent way. So, it can be seen as OS of DS.

        * Document-based MW, File-system-based WM, Object-based WM, Coordination-based MW.

    * Compare to multicomputer system, a distributed system has its strength and weakness, it's strength because it's power and weak due to it's difficult.

    * MapReduce

    * Message Queue service [why you need it : zhihu](https://www.zhihu.com/question/34243607)

        * RocketMQ [ali message queue service](http://www.jianshu.com/p/453c6e7ff81c)

        * ZeroMQ 
        under message queue logic, beyond socket logic, is a network library. [manual](https://github.com/anjuke/zguide-cn/blob/master/chapter1.md) 用来学习常见的网络模型正合适
        [another critical](https://zhuanlan.zhihu.com/p/22947038)
        [why zero MQ implemented in cpp is an wrong choice](http://blog.jobbole.com/19647/)

    * Load balance
        
        * load balance algo :

            1.  Round Robin/Weight Round Robin Scheduling:轮询算法通过依次轮叫的方式依次将请求调度不同的后端服务器(Real Server)。通常可以分为普通轮询和加权轮询两种方式。算法的优点是简洁且无状态。 算法简单表示为：i = ( i + 1  ) mod n
            2. Sources Hashing Scheduling :Hash算法，又叫取余算法。一般是对请求报文中的某项数据(key，一般常用客户端来源IP)计算Hash值，然后按机器数量(n)取模。 算法简单表示为：idx = Hash(key) % n Hash算法中，Key的选择常用实践如下： a、请求时间或随机数 特点是简单，具有一定分散性，但不稳定，一般用于要求不高的负载均衡场景。 b、来源IP 特点是简单。如果客户的分布比较广，这种方式分散性较好。但如果较多的客户请求来源于同一IP（公司网络通过路由器上网），分散效果较差。 大多负载均衡设备都支持这种算法，著名的nginx和LVS等软件也支持。
            3. Consistency Hash Scheduling :[ref](http://blog.codinglabs.org/articles/consistent-hashing.html)
            4. Least Connection/Request Scheduling :最小连接调度是一种动态调度算法，它通过服务器当前所活跃的连接数来估计服务器的负载情况。 算法主要逻辑是，调度设备或服务记录后端服务器接受请求的计数，每次请求总是发给计数最小的服务器处理。

* distributed-system important concept and Techniques  [zhihu](https://www.zhihu.com/question/23645117); [good blog](http://chenkangxian.iteye.com/blog/1674198)

<a name="Hbestpractice"></a>

# Best Practice in code and design

* B-P in concurrency programming [ref](http://stackoverflow.com/questions/660621/threading-best-practices)

    * You'd best init all working thread at the main() begining, then dispatch new job to threadpool. If not, more cost.

        1. also note the thread pool, when you use a notify_all(), may cause **thundering herd**, which can be solved by  要想避免如上线程池设计中的惊群问题，在仍然共用一个线程互斥锁的条件下，给每一个消费者线程创建一个线程条件变量，生产者线程在添加任务时，找到空闲的消费者线程，将任务置入该消费者的任务队列中同时只通知 (pthread_cond_signal) 该消费者的线程条件变量，消费者线程与生产者线程虽然共用相同的线程互斥锁（因为有全局资源及调用 pthread_cond_wait 所需），但线程条件变量的通知过程却是定向通知的，未被通知的消费者线程不会被唤醒，这样惊群现象也就不会产生了。

    * You'd best do two things(1. object lifetime 2. obejct race condition) when using resources between threads, like using a queue to pass data between two threads. If not, not thread safe. 
[ref](https://stackoverflow.com/questions/9697865/what-happens-if-i-call-an-objects-member-function-from-a-different-thread)

    * You'd best not create threads more than the core amount of CPU. If not, thrashing in Virtual Memory would happen and context switch overhead, consider thread pool.

    * You'd best not use other IPC except fd to share data. If not, may dead lock.

    * You'd best lock and unlock resource at one order(small to large) to avoid deadlock. If not, deadlock!, [stack](https://stackoverflow.com/questions/1951275/would-you-explain-lock-ordering)

        > thread1       thread2

        > lock(B)

        >  ----------    lock(C)

        >  ----------    lock(B)    >>>> would block here

        >  ----------    release(B)

        >  ----------    release(C)

        > lock(C)       >>>>>> would block here

        > release(B)

    * You'd best let process into a state of unable to serve and kill it, when you want to cancel a long-time multithread program. If not, so hard to safely quit.

    * You'd best wrap fd with RAII. If not, you may read fd=13, and switch to other thread, which close fd=13, and create a new fd, which have the same id=13 by the linux-fd-rule. Then you may try to do something invalid with fd=13, while RAII won't let managed resource fd=13 to be closed at elsewhere.

    * You'd best descript thread-safety and forkable of your program. If not, user might wrong use.

    * You'd best not use signal in multithread program, if you must, use [signalfd](#signalfd). If not, signal would hell you up.

    * You'd best not using fork() to create worker process with fd to IPC, instead create process with FD_CLOEXEC, and exec() as soon as possible. If not, fork() won't work well with multithread.

* B-P in networking programming

    * You'd best know about c10k and c1000k
        
        <a name="io:c10k"></a>
        * c10k : 采用epoll的event loop [ref](http://www.kegel.com/c10k.html)

        * c1000k : file descriptor not enough => solution : (1) 修改内核 (2) 使用用户态的tcp/ip协议栈 [ref](http://www.ideawu.net/blog/archives/740.html)
    * You'd best know how to set socket opt 

        * You'd best set SO_REUSEADDR [TLPI 61.10]() for TCP server. SO_REUSEADDR允许启动一个监听服务器并捆绑其众所周知的端口，即使以前建立的将该端口用作他们的本地端口的连接仍存在。. If not, you would get 'error:98，Address already in use' when restart your tcpserver.

    * You'd best know how to read and write a socket. If not, get into pitfall.

        * You'd best use a application buffer as 4-16 KB size, to read from socket or write into socket.
        If not, as read side, it may happen that you failed to receive data when tcp buffer is full, which would cause effective problem, otherwise, this may happen too that TCP received data that can't conpose one app-package or multiple app-package, which has no different to you due to the stream attribution of TCP.
        Also, as write side, if you want write 80KB, socket receive 32KB, what about the rest? The caller called this tcp-peer object won't waste time to wait.

        * You'd best apply your app-package scheme in application layer. If not, may stick package. [ref](http://www.cnblogs.com/QG-whz/p/5537447.html)

        * You'd best assume a connection is connected when EPOLLOUT return with out EPOLLERR and getsockopt(sock, SOL_SOCKET, SO_ERROR, ...) to check if the connect succeeded or write successful. If not, may get 'connection refused'. [ref](https://stackoverflow.com/questions/2875002/non-blocking-tcp-connect-with-epoll)

        * You'd best remenber to check return value of read, -1 means 'error', 0 means 'you can close it'

    * You'd best know how to close a socket. If not, get into pitfall [best practice in socket](http://h41379.www4.hpe.com/openvms/journal/v3/tcpip.pdf)

        * You'd best use shutdown() and wait for more read then close. If not, may lead to ungraceful close. [ref](https://stackoverflow.com/questions/8872988/properly-close-a-tcp-socket) , shutdown vs close [csdn](http://blog.csdn.net/lgp88/article/details/7176509):
            >  close函数会关闭套接字ID，如果有其他的进程共享着这个套接字，那么它仍然是打开的，这个连接仍然可以用来读和写，并且有时候这是非常重要的 ，特别是对于多进程并发服务器来说。 而shutdown会切断进程共享的套接字的所有连接，不管这个套接字的引用计数是否为零，那些试图读得进程将会接收到EOF标识，那些试图写的进程将会检测到SIGPIPE信号，同时可利用shutdown的第二个参数选择断连的方式。

        * You'd best be worried about TIME_WAIT. If not, would have too much socket on TIME_WAIT. usually server would let client to close socket, but some time you need close it activly, see this : [nginx lingering_close](http://tengine.taobao.org/book/chapter_02.html#connection); ;;   [run out of ports because TIME_WAIT](https://stackoverflow.com/questions/26019164/too-many-time-wait-connections-getting-cannot-assign-requested-address) is caused by active close of socket by server/client side, solved by let client/server close the socket, (which would let server trapped into TIME_WAIT problem) solution is below :

            1. First solution of Appache is : let client to close that && keepalive as persistent TCP connection.

            2. Second solution is : For non-persistent TCP connection, like http server, You'd best solve too mant TIME_WAIT problem by [ref](http://blog.csdn.net/yusiguyuan/article/details/21445883)
                1. Close in TCP using SO_LINGER [ref](http://blog.csdn.net/factor2000/article/details/3929816)
                2. change setting for kernel : sysctl改两个内核参数就行了，如下： net.ipv4.tcp_tw_reuse = 1 net.ipv4.tcp_tw_recycle = 1

    * You'd best know the correct solution when using epoll. If not, may get into pitfall.[how epoll is implement](https://www.quora.com/Network-Programming-How-is-epoll-implemented)

        * You'd best not shared epollfd in two thread.  If not, it is no longer a single task on the wait queue, but a structure that itself contains another wait queue, containing all processes currently waiting on the epoll fd.

        * You'd best not waiting same fd in multi-thread epoll. If not, may need EPOLLET and EPOLLONESHOT. [ref](https://stackoverflow.com/questions/7058737/is-epoll-thread-safe)

        * just treat these events the same as EPOLLIN/EPOLLOUT and call recv() (or send() as appropriate) [ref](https://stackoverflow.com/questions/8707458/epoll-and-remote-1-way-shutdown) 

        * epoll example code [ref](https://banu.com/blog/2/how-to-use-epoll-a-complete-example-in-c/)

        * how to detect peer close : when peer close, EPOLLIN and EPOLLRDHUP would be set  (so! you should check both EPOLLIN with read zero and EPOLLRDHUP)
[ref](https://stackoverflow.com/questions/8707458/epoll-and-remote-1-way-shutdown) 
[ref](https://www.zhihu.com/question/46807567/answer/104224439)
[ref](https://stackoverflow.com/questions/6437879/how-do-i-use-epollhup)

        * exclusive and epoll level [ref](https://stackoverflow.com/questions/41582560/how-does-epolls-epollexclusive-mode-interact-with-level-triggering)

        * when using epoll with level triggered, what's the right way?  [ref](http://kimi.it/515.html)

            >一道腾讯后台开发的面试题
            >使用Linuxepoll模型，水平触发模式；当socket可写时，会不停的触发socket可写的事件，如何处理？

            >第一种最普遍的方式：
            >需要向socket写数据的时候才把socket加入epoll，等待可写事件。
            >接受到可写事件后，调用write或者send发送数据。
            >当所有数据都写完后，把socket移出epoll。
            >这种方式的缺点是，即使发送很少的数据，也要把socket加入epoll，写完后在移出epoll，有一定操作代价。

            >一种改进的方式：
            >开始不把socket加入epoll，需要向socket写数据的时候，直接调用write或者send发送数据。如果返回EAGAIN( 缓存问题 )，把socket加入epoll，在epoll的驱动下写数据，全部数据发送完毕后，再移出epoll。
            >这种方式的优点是：数据不多的时候可以避免epoll的事件处理，提高效率。
            
        * how to use EPOLLEXCLUSIVE for accept(), and why EAGAIN [ref](https://idea.popcount.org/2017-02-20-epoll-is-fundamentally-broken-12/)

        * deregistering file descriptor before close is nescesary. [ref](https://idea.popcount.org/2017-03-20-epoll-is-fundamentally-broken-22/)

<a name="Godknow"></a>

# AI & Deep-learning, Principle & Practice


<a name="Jjkkn"></a>

# Database

* Database system fundamental concept
    
    * CSDN 把这个博客读完,把知识点归纳到笔记中, TOOD[overview](http://blog.csdn.net/han_xiaoyang/article/details/11006703)
    * Overview how database works [ref](http://blog.jobbole.com/100349/)

    * 1NF,2NF,3NF,BCNF  [ref](https://yq.aliyun.com/articles/51019)
    
    * 键和索引 [csdn](http://blog.csdn.net/xrt95050/article/details/5556411)

    * Relation modle
        
        * database = set of named relations(or tables)
        
        * each relation has named attribute(or colums)
        
        * each tuple (or row) has a value for each attrbitue
        
        * each attribute has a type(or domain)
        
        * schema, extral schema, internal schema(模式，外模式，内模式) schema is like type while data is like values, comparing to programming language.
            
            * extral schema is (subschema) used for user. 
            
            * internal schma is (storage schema) used for DBM to store. [zhihu](https://zhuanlan.zhihu.com/p/27330413)
        
        * Instance, the actual content
        
        * NULL, "undefined" (careful)
        
        * Key, set of or one that is unique in each tuple
            1. Primary key
            2. Foreign key
        
        * Index,
            1. normal index
            2. unique index
            3. global index
            4. multi-colum index

    * relation algebra

    * design good schema

    * SQL
        1. why don't use **select \*?**, [zhihu](https://www.zhihu.com/question/37777220)

    * Relation algebra

    * XML

    * transaction ACID

* SQLite

* technical in database (maybe used other places):

    * 悲观锁，乐观锁，排他锁 X锁, 共享锁 S锁:

        * 悲观锁 假定会发生并发冲突,原理是： 如果一个事务需要一条数据 它就把数据锁住 如果另一个事务也需要这条数据 它就必须要等第一个事务释放这条数据 

        * 乐观锁 假设不会发生并发冲突, 原理是：各事务能够在不产生锁的情况下处理各自影响的那部分数据。在提交数据更新之前，每个事务会先检查在该事务读取数据后，有没有其他事务又修改了该数据。如果其他事务有更新的话，正在提交的事务会进行回滚。

        * 排他锁,共享锁是这样的： 如果一个事务只需要读取数据A 它会给数据A加上『共享锁』并读取 如果第二个事务也需要仅仅读取数据A 它会给数据A加上『共享锁』并读取 如果第三个事务需要修改数据A 它会给数据A加上『排他锁』，但是必须等待另外两个事务释放它们的共享锁。

<a name="Zzzfweq"></a>

# Others


* UML graph

* 电梯调度算法 [ref](http://www.cnblogs.com/jianyungsun/archive/2011/03/16/1986439.html)

<a name="restful"></a>
* REST 
GET请求的数据会附在URL之后（就是把数据放置在HTTP协议头中），以?分割URL和传输数据，参数之间以&相连，如：login.action?name=hyddd&password=idontknow&verify=%E4%BD%A0%E5%A5%BD; [simple in chinese](https://github.com/astaxie/build-web-application-with-golang/blob/master/zh/08.3.md) 
[stack overflow the second answer](https://stackoverflow.com/questions/671118/what-exactly-is-restful-programming)
[ref zhihu](https://www.zhihu.com/question/28557115)
In one word, REST(Representatonal State Transfer) is one of *the three main ways* to implement a web service both frontend and backend and web service API design, where the other two are SOAP & XML-RPC. Note, REST is just a *design principle and architectural style*, not standard.
An API that adheres to the principles of REST does not require the client to know anything about the structure of the API.
        For example :
        Restful : url.cn/username/gender/age/account
            on every level of url, there is a *resource* to for your request, and you can put your request detail into content
        GET /products : will return the list of all products
        POST /products : will add a product to the collection
        GET /products/4 : will retrieve product #4
        PATCH/PUT /products/4 : will update product #4
        SOAP : url.cn/username?xxxx&gender?xxxx&age?xxx&account?xxxx
            '?' would be parsed as a argument for web server

* JS - single-page-application [ref](https://en.wikipedia.org/wiki/Single-page_application)

* MVC [ref](http://www.ruanyifeng.com/blog/2015/02/mvcmvp_mvvm.html)

* SOA service-oriented-architecture

* c/c++ compile pitfall

    * dynamic vs static library [ref](http://stackoverflow.com/questions/140061/when-to-use-dynamic-vs-static-libraries)

* Memory and process : resident set size [ref](https://en.wikipedia.org/wiki/Resident_set_size)

* Multiprocessing & Multi-core processor : check it in ModernOS

* Virtualization And The Cloud

* Interpretor of lisp implemented in cpp : check cpp_code_slide.md

* A Embedded script language : [ref](http://stackoverflow.com/questions/12042955/what-is-an-embedded-scripting-language)

* Programming to the interface [ref](https://softwareengineering.stackexchange.com/questions/232359/understanding-programming-to-an-interface)
[ref](http://web.cse.ohio-state.edu/software/2221/web-sw1/extras/slides/09.Design-by-Contract.pdf), it's not a paradigm, it's a theory.

* Corutine : [ref](https://www.zhihu.com/question/21483863)

* java is memory killer because java support mutable only for primitive type, so every object is immutable. When there is a need for a value-semantic, java can only support this by create a new object. //TODO really? check it

* java memory layout is not as locality as cpp.

* static-libray vs dynamical-library vs so vs dll : [ref](https://stackoverflow.com/questions/9688200/difference-between-shared-objects-so-static-libraries-a-and-dlls-so)

* int long bytes in 64 and 32 [ref](http://blog.csdn.net/sky_qing/article/details/11650497)

* 低耦合高内聚 ： [ref](http://www.cnblogs.com/robnetcn/archive/2012/04/15/2449008.html) loose coupling [wifipedia](https://en.wikipedia.org/wiki/Loose_coupling)

* **micro-service vs web-service** [ref](http://www.tatvasoft.com/blog/the-difference-between-micro-services-and-web-services/)

* **micro-service in deep** 
[ref](https://smartbear.com/learn/api-design/what-are-microservices/)
I also have a book.

* 高并发 [zhihu](https://www.zhihu.com/question/21177474)

* Networking program tips

     1. port < 1024 can only to bind to 'root'

## code slide gallery

* dup delete

    <a name="dupdelete"></a>

    ```cpp
    #include <string>
    #include <vector>
    #include <algorithm>
    #include <iostream>

    using namespace std;
    struct node {
      int val;
        node* next;
        node(int v) : val(v), next(nullptr) {}
    };
    node* doit(node* head) {
        if (head = nullptr) {return nullptr;}
        node* ret = new node(-1);
        node* p = ret;
        p->next = head;
        node* q = head;
        while (q) {
          q= q->next;
          bool dup = false;
          while (q && p->next->val == q->val) {
            q = q->next;  
              dup = true;
          
          }
          if (dup) { 
            p->next = q; 
          } else {
            p = p->next;
          
          }
        
        }
        return ret->next;

    }

    int main() {
        
        node* n1 = new node(1);
        n1->next = new node(2);
        n1->next->next = new node(2);
        n1->next->next->next = new node(3);
        n1->next->next->next->next = new node(5);
        auto nn = doit(n1);
        while (nn) {
            cout << nn->val;
            nn = nn->next;
        
        }

    }
    ```

<a name="triecode"></a>

* Trie code

    ```cpp
    // C implementation of search and insert operations
    // on Trie
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdbool.h>
     
    #define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
     
    // Alphabet size (# of symbols)
    #define ALPHABET_SIZE (26)
     
    // Converts key current character into index
    // use only 'a' through 'z' and lower case
    #define CHAR_TO_INDEX(c) ((int)c - (int)'a')
     
    // trie node
    struct TrieNode {
        struct TrieNode *children[ALPHABET_SIZE];
        // isLeaf is true if the node represents
        // end of a word
        bool isLeaf;
    };
     
    // Returns new trie node (initialized to NULLs)
    struct TrieNode *getNode(void) {
        struct TrieNode *pNode = NULL;
        pNode = (struct TrieNode *)malloc(sizeof(struct TrieNode));
        if (pNode) {
            int i;
            pNode->isLeaf = false;
            for (i = 0; i < ALPHABET_SIZE; i++)
                pNode->children[i] = NULL;
        }
        return pNode;
    }
     
    // If not present, inserts key into trie
    // If the key is prefix of trie node, just marks leaf node
    void insert(struct TrieNode *root, const char *key) {
        int level;
        int length = strlen(key);
        int index;
        struct TrieNode *pCrawl = root;
        for (level = 0; level < length; level++) {
            index = CHAR_TO_INDEX(key[level]);
            if (!pCrawl->children[index])
                pCrawl->children[index] = getNode();
            pCrawl = pCrawl->children[index];
        }
        // mark last node as leaf
        pCrawl->isLeaf = true;
    }
     
    // Returns true if key presents in trie, else false
    bool search(struct TrieNode *root, const char *key) {
        int level;
        int length = strlen(key);
        int index;
        struct TrieNode *pCrawl = root;
        for (level = 0; level < length; level++) {
            index = CHAR_TO_INDEX(key[level]);
            if (!pCrawl->children[index])
                return false;
            pCrawl = pCrawl->children[index];
        }
        return (pCrawl != NULL && pCrawl->isLeaf);
    }
     
    // Driver
    int main() {
        // Input keys (use only 'a' through 'z' and lower case)
        char keys[][8] = {"the", "a", "there", "answer", "any",
                         "by", "bye", "their"};
        char output[][32] = {"Not present in trie", "Present in trie"};
        struct TrieNode *root = getNode();
        // Construct trie
        int i;
        for (i = 0; i < ARRAY_SIZE(keys); i++)
            insert(root, keys[i]);
        // Search for different keys
        printf("%s --- %s\n", "the", output[search(root, "the")] );
        printf("%s --- %s\n", "these", output[search(root, "these")] );
        printf("%s --- %s\n", "their", output[search(root, "their")] );
        printf("%s --- %s\n", "thaw", output[search(root, "thaw")] );
        return 0;
    }
    ```

<a name="knapsack"></a>
* code 背包问题 code
  
    ```cpp
        // consider n packet, every packet has value v[i], and a cost c[i], given a max_cost, query the max value can get

    int dp(int n, vector<int>& v, vector<int>& c, int max_cost) {
        if (n == 0 || max_cost == 0) {return 0;}
        if (c[n] > max_cost) {
            return dp(n - 1, v, c, max_cost);
        } else {
            return max(dp(n - 1, v, c, max_cost - c[n]) + v[n], dp(n - 1, v, c, max_cost));
        }
    }

    int main() {
        // n, v, c, max_cost

        cout << dp(v.size() - 1, v, c, max_cost);
    }
    ```

<a name="Nagel"></a>
* Nagel

    ```cpp
    IF 数据的大小和窗口的大小都超过了MSS
        Then 发送数据分段
    ELSE
        IF 还有发出的TCP分段的确认没有到来  // 后来变为===> IF 还有发出的不足MSS大小的TCP分段的确认没有到来 less delay
            Then 积累数据到发送队列的末尾的TCP分段
        ELSE
            发送数据分段
    ```

<a name="simplecalculator"></a>
* simplecalculator

    ```cpp
    /*
    *Caculator Parser
    *
    *   expression
    *       term
    *       expression + term
    *       expression - term
    *
    *   term
    *       primary
    *       term * primary
    *       term / primary
    *
    *   primary
    *       number
    *       "("expression")"
    *
    *   number
    *       float-pointing-literal
    */

    #include "../std_lib_facilities.h"
    class Token
    {
      public:
        Token(char ch)
            : kind(ch), value(0){};
        Token(char ch, double val)
            : kind(ch), value(val){};
        char kind;
        double value;

    };

    class Token_stream
    {
      public:
        Token_stream() : full(false), buffer(0){};
        Token get();
        void putback(Token c);

      private:
        bool full;
        Token buffer;

    };

    void Token_stream::putback(Token t)
    {
        buffer = t;
        full = true;

    }

    Token Token_stream::get()
    {
        if (full)
        {
            full = false;
            return buffer;
        
        }
        char ch;
        cin >> ch;
        switch (ch)
        {
        case '(':
        case ')':
        case '+':
        case '-':
        case '*':
        case '/':
        case 'q':
        case ';':
            return Token(ch);
        case '.':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            cin.putback(ch);
            double val;
            cin >> val;
            return Token('8', val);
        default:
            error("Bad Token");
        
        }

    }

    Token_stream ts;

    double expression();

    double primary()
    {
        Token t = ts.get();
        switch (t.kind)
        {
        case '(':
            {
            double d = expression();
            t = ts.get();
            if (t.kind != ')')
                error("')' expected");
            return d;
        
            }

        case '8':
            return t.value;
        default:
            error("primary expected");
        }
    }

    double term()
    {
        double left = primary();
        Token t = ts.get();
        while (true)
        {
            switch (t.kind)
            {
            case '*':
                left *= primary();
                t = ts.get();
                break;
            case '/':
                {
                double val = primary();
                if (val == 0)
                    error("divide by zero");
                left /= val;
                t = ts.get();
                break;
            
                }
            default:
                ts.putback(t);
                return left;
            
            }
        
        }

    }

    double expression()
    {
        double left = term();
        Token t = ts.get();
        while (true)
        {
            switch (t.kind)
            {
            case '+':
                left += term();
                t = ts.get();
                break;
            case '-':
                left -= term();
                t = ts.get();
                break;
            default:
                ts.putback(t);
                return left;
            
            }
        
        }

    }

    int main()
    {
        cout << "welcome to our simple caculator." << endl;
        cout << "please enter expressions using float numbers." << endl;
        try
        {
            double val;
            while (cin)
            {
                Token t = ts.get();
                if (t.kind == 'q')
                    break;
                if (t.kind == ';')
                    cout << "=" << val << endl;
                else
                    ts.putback(t);
                val = expression();
            
            }
            keep_window_open();
        
        }
        catch (exception &e)
        {
            cerr << e.what() << endl;
            keep_window_open();
            return 1;
        
        }
        catch (...)
        {
            cerr << "exception\n";
            keep_window_open();
            return 2;
        
        }
        return 0;
    }
    ```

<a name="dijkstra"></a>
* Dijkstra

    ```
        Pseducode

        given graph[i][j] and src, N nodes
        dist[N], and init them to INF
        dist[src] = 0
        visited[N], and init them to false
        while (N--)
            find the nearest node as u not yet visited
            visited[u] = true
            for each edge of u
                update the distance of peer node
    ```

<a name="bellmanford"></a>
* bellmanford

    ```
        Pseducode

        function : given graph[i][j] and src, N nodes
        dist[N], and init them to INF
        dist[src] = 0
        while (N--)
            for each edge u-v
                if dist[v] > dist[u] + weight(u, v)
                    dist[v] = dist[u] + weight(u, v)
        for each edge u-v
            if dist[v] > dist[u] + weight(u, v)
                throw("detect negative cycle")
    ```

<a name="floydwarshall"></a>
* floydwarshall

    ```
    Pseducode

    function : given graph[i][j] and src, N nodes
    dist[i][j] is the shortest from i to j
    assign dist[i][j] to graph[i][j]        // we think there is no intermidiate node
    for k from 0 to N - 1
        for i from 0 to N - 1
            for j from 0 to N - 1
                d1 = dist[k][j]     //the shortest path when having {0, 1...k-1} as intermidiate node
                d2 = dist[i][k]     // the shortest path when ....
                if dist[i][j] > d1 + d2
                    dist[i][j] = d1 + d2
    ```

<a name="fordfullkerson"> </a>
* Ford-Fullkerson 

    ```
        Pseducode

        function : given flow[i][j] and src, sink
        while there is an augument path from src to sink
            make flow[][] minus the value of max possible flow in augument path

        find augument path

        function : given flow[i][j] and src, sink, path[n], return true if exist
        to_visited[], visited[]
        to_visited += src
        while (!to_visited.empty)
            u = tovisited.pop
            for each edge e from u to v, v not visited
                to_visite += v
                path[v] = u
                visited[v] = true
        return visited[sink]
    ```

<a name="writereadlockbyatomic"></a>
* write read lock by atomic
    
    If we use non-atomic operation, when read fetch value into register, write can already check and enter the critical zone, then writer runs as reader also in the critical zone.

    ```cpp
    #include <string>
    #include <thread>
    #include <vector>
    #include <iostream>
    #include <atomic>
    #include <chrono>
     
    // meaning of cnt:
    // 10: there are no active readers or writers.
    // 1...9: there are 9...1 readers active, The writer is blocked
    // 0: temporary value between fetch_sub and fetch_add in reader lock
    // -1: there is a writer active. The readers are blocked.
    const int N = 10; // nine concurrent readers are allowed
    std::atomic<int> cnt = ATOMIC_VAR_INIT(N);
     
    std::vector<int> data;
     
    void reader(int id) {
        for(;;) {
            // lock
            while(std::atomic_fetch_sub(&cnt, 1) <= 0)
                std::atomic_fetch_add(&cnt, 1);
            // read
            if(!data.empty())
                std::cout << (  "reader " + std::to_string(id)
                              + " sees " + std::to_string(*data.rbegin()) + '\n' );
            if(data.size() == 100)
                break;
            // unlock
            std::atomic_fetch_add(&cnt, 1);
            // pause
            std::this_thread::sleep_for(std::chrono::milliseconds(1));
        }
    }
     
    void writer() {
        for(int n = 0; n < 100; ++n) {
            // lock
            while(std::atomic_fetch_sub(&cnt, N+1) != N)
                std::atomic_fetch_add(&cnt, N+1);
            // write
            data.push_back(n);
            std::cout << "writer pushed back " << n << '\n';
            // unlock
            std::atomic_fetch_add(&cnt, N+1);
            // pause
            std::this_thread::sleep_for(std::chrono::milliseconds(1));
        }
    }
     
    int main() {
        std::vector<std::thread> v;
        for (int n = 0; n < N; ++n) {
            v.emplace_back(reader, n);
        }
        v.emplace_back(writer);
        for (auto& t : v) {
            t.join();
        }
    }
    ```

<a name="spinlock"></a>
* Spin lock, is often used by linux kernel to prevent concurrent modifications to data structures like waitqueues, (if overhead of spin wait is smaller than mutex switch) :
    1.  implement using std::atomic<> [ref](http://stackoverflow.com/questions/29533755/why-is-stdmutex-faster-than-stdatomic) 

    ```cpp
    class SpinLock {
        protected :
            enum class State : Enum {
                Locked = 0x0070
                Unlocked = 0x0071
            };
            Atomic<State> _state;
        public :
            SpinLock() : _state(State::Unlocked) { }

            ~SpinLock() {  }

            void lock() {
                while (this->_state.exchange(State::Locked, std::memory_order_acquire) != State::Unlocked) {
                    std::this_thread::yield();
                }
            }

            bool try_lock() {
                return this->_state.exchange(State::Locked, std::memory_order_acquire) == State::Unlocked;
            }

            void unlock() {
                this->_state.store(State::Unlocked, std::memory_order_release);
            }

            bool is_locked() const {
                return this->_state.load(std::memory_order_acq_rel) == State::Locked;
            }
    };
    ```
    1. & implement real deadly wait spin lock [cpp concurrency in action, p112]()

    ```cpp
    class spinlock_mutex {
        std::atomic_flag flag;
        public:
        spinlock_mutex(): flag(ATOMIC_FLAG_INIT) {}

        void lock() {
            while(flag.test_and_set(std::memory_order_acquire));
        }
        void unlock() {
            flag.clear(std::memory_order_release);
        }
    };
    ```

<a name="lockfreestack"></a>
* a very simple lock free stack, [cppconcurrencyinaction p185]()

    ```cpp
    template<typename T>

    class lock_free_stack {
            struct node {
                T data;
                node* next;
                node(T const& data_):
                    data(data_), next(nullptr) {}
            };
            std::atomic<node*> head;
        public:
            void push(T const& data) {
                node* const new_node=new node(data);
                new_node->next=head.load();
                while(!head.compare_exchange_weak(new_node->next,new_node));
            }
            T pop() {
                node* old_head = head.load();
                while (!head.compare_exchange_weak(old_head, old_head->next));
                T ret =  old_head->data;        // bug, what if other thread pop out?
                free(old_head);
                return ret;
            }
    };
    ```

<a name="lockfreequeue"></a>
* a very simple lock free queue, [cppconcurrencyinaction c 7.2.6]()

    ```cpp
    template<typename T>
    class lock_free_queue {
        struct node {
            T data;
            node* next;
            node(T const & data_) : data(data_), next(nullptr) {}
        };
        std::atomic<node*> head;
        std::atomic<node*> tail;
    public :
        void push(T const& data) {
            node* newnode = new node(data);
            node* old_tail = tail.load();
            while (1) {
                if (!tail.compare_exchange_weak(old_tail, newnode)) {
                    old_tail->next = newnode;   // bug, what if old_tail is already pop out
                }
            }
        }
        T pop() {
            node* old_head = head.load();
            if (old_head == nullptr) {throw std::exception();}
            while (!head.compare_exchange_weak(old_head, old_head->next));
            T ret =  old_head->data;        
            free(old_head);
            return ret;
        }
    }
    ```

<a name="topologicalsort"></a>
* topological sort 

    ```cpp
    // A C++ program to print topological sorting of a DAG
    #include<iostream>
    #include <list>
    #include <stack>
    using namespace std;
     
    // Class to represent a graph
    class Graph {
        int V;    // No. of vertices'
     
        // Pointer to an array containing adjacency listsList
        list<int> *adj;
     
        // A function used by topologicalSort
        void topologicalSortUtil(int v, bool visited[], stack<int> &Stack);
    public:
        Graph(int V);   // Constructor
     
         // function to add an edge to graph
        void addEdge(int v, int w);
     
        // prints a Topological Sort of the complete graph
        void topologicalSort();

    };
     
    Graph::Graph(int V) {
        this->V = V;
        adj = new list<int>[V];
    }
     
    void Graph::addEdge(int v, int w) {
        adj[v].push_back(w); // Add w to v’s list.
    }
     
    // A recursive function used by topologicalSort
    void Graph::topologicalSortUtil(int v, bool visited[], 
                                    stack<int> &Stack) {
        // Mark the current node as visited.
        visited[v] = true;
     
        // Recur for all the vertices adjacent to this vertex
        list<int>::iterator i;
        // for v = 0, beacuse we only have edge from 4,5 to 0, so list is empty
        for (i = adj[v].begin(); i != adj[v].end(); ++i)    
            if (!visited[*i]) {
                // some depends on this would be pushed into before this 
                // ==> and this is what we want gurantee
                topologicalSortUtil(*i, visited, Stack);    
            }
     
        // Push current vertex to stack which stores result
        Stack.push(v);

    }
     
    // The function to do Topological Sort. It uses recursive 
    // topologicalSortUtil()
    void Graph::topologicalSort() {
        stack<int> Stack;
     
        // Mark all the vertices as not visited
        bool *visited = new bool[V];
        for (int i = 0; i < V; i++)
            visited[i] = false;
     
        // Call the recursive helper function to store Topological
        // Sort starting from all vertices one by one
        for (int i = 0; i < V; i++)
          if (visited[i] == false)
            topologicalSortUtil(i, visited, Stack);
     
        // Print contents of stack
        while (Stack.empty() == false) {
            cout << Stack.top() << " ";
            Stack.pop();
        }
    }
     
    // Driver program to test above functions
    int main() {
        // Create a graph given in the above diagram
        Graph g(6);
        g.addEdge(5, 2);
        g.addEdge(5, 0);
        g.addEdge(4, 0);
        g.addEdge(4, 1);
        g.addEdge(2, 3);
        g.addEdge(3, 1);
        cout << "Following is a Topological Sort of the given graph n";
        g.topologicalSort();
        return 0;
    }
    ```
