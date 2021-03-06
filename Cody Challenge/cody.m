%Problem 1. Times 2 - START HERE
function y = p1(x)
    y = 2 * x;
end

%Problem 2. Make the vector [1 2 3 4 5 6 7 8 9 10]
function y = p2()
    y = 1:10;
end

%Problem 3. Find the sum of all the numbers of the input vector
function y = p3(x)
    y = sum(x);
end

%Problem 4. Make a checkerboard matrix
function a = p4(n)
    a = zeros(n);
    a(1:2:end) = 1; 
end

%Problem 5. Triangle Numbers
function t = p5(n)
    t = sum(1:n);
end

%Problem 6. Select every other element of a vector
function y = p6(x)
    y = x(1:2:end);
end

%Problem 7. Column Removal
function B = p7(A, n)
    B = A;
    B(:, n) = [];
end

%Problem 8. Add two numbers
function c = p8(a,b)
  c = a+b;
end

%Problem 9. Who Has the Most Change?
function b = p9(a)
    temp = a;
    temp(:,1) = temp(:,1) * 0.25;
    temp(:,2) = temp(:,2) * 0.10; 
    temp(:,3) = temp(:,3) * 0.05; 
    temp(:,4) = temp(:,4) * 0.01; 
    [~, b] = max(sum(temp, 2));
end

%Problem 10. Determine whether a vector is monotonically increasing
function tf = p10(x)
       tf = sum(diff(x)>0)==(length(x)-1);
end

%Problem 11. Back and Forth Rows
function a = p11(n)
    a = reshape(1:n^2, n, n)';
    a(2:2:end, :) = flip(a(2:2:end, :), 2);
end

%Problem 12. Fibonacci sequence
function f = p12(n)
    if n < 3
        f = 1;
    else
       f = p12(n - 1) + p12(n - 2);
    end
end

%Problem 13. Remove all the consonants
function s2 = p13(s1)
    cons = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z","B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","V","W","X","Y","Z"];
    s2 = s1(~ ismember(s1(:), cons));
end

%Problem 14. Find the numeric mean of the prime numbers in a matrix.
function out = p14(in)
    out = mean(in(isprime(in)));
end

%Problem 15. Find the longest sequence of 1's in a binary sequence.
function y = p15(x)
    temp = (x == '1');
    y = max(accumarray(nonzeros((cumsum(~temp) + 1) .* temp), 1));
end

%Problem 16. Return the largest number that is adjacent to a zero
function y = p16(x)
    y = max([x(x - [0 diff(x)] == 0) x(x(1:end - 1) + diff(x) == 0) ]);
end

%Problem 17. Find all elements less than 0 or greater than 10 and replace them with NaN
function y = p17(x)
    y = x;
    y(x < 0 | x > 10) = NaN;
end

%Problem 19. Swap the first and last columns
function B = p18(A)
    B=A
    B(:,end) = A(:,1);
    B(:,1) = A(:,end);
end

%Problem 20. Summing digits
function b = p20(n)
    b = sum(num2str(2^n)-'0');
end

%Problem 21. Return the 3n+1 sequence for n
function c = p21(n)
    if n == 1
        c = [1];
    elseif mod(n, 2) == 0
        c = [n p21(n / 2)];
    else
        c = [n p21(3 * n + 1)];
    end
end

%Problem 22. Remove the vowels
function s2 = p22(s1)
    cons = [" ","b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z","B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","V","W","X","Y","Z"];
    s2 = s1(ismember(s1(:), cons));
end

%Problem 23. Finding Perfect Squares
function b = p23(a)
    b = sum(ismember(a .^ 2, a)) > 0;
end

%Problem 24. Function Iterator
function fh2 = p24(fh, n)
    fh2 = fh;
    for k = 1:n-1
        fh2 = @(x)fh(fh2(x));
    end
end

%Problem 25. Remove any row in which a NaN appears
function B = p25(A)
    B = A(all(A==A, 2),:);
end

%Problem 26. Determine if input is odd
function tf = p26(n)
    tf = mod(n, 2) ~= 0; 
end

%Problem 27. Pangrams!
function tf = p27(s)
    alphabet = [ ' ' 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'];
    tf = sum(ismember(alphabet, lower(s))) == 27;
end

%Problem 29. Nearest Numbers
function [index1 index2] = p29(A)
    temp = abs(A' - A);
    [min_val, ~]=min(temp((1:size(temp,1)).' > (1:size(temp,2))));
    [~, y] = find(temp + diag(zeros(length(A),1) + NaN) == min_val);
    index1 = min(y(1));
    index2 = max(y(2));
end

%Problem 30. Sort a list of complex numbers based on far they are from the origin.
function zSorted = p30(z)
    [~, i] = sort(abs(z));
    zSorted = z(flip(i));
end

%Problem 32. Most nonzero elements in row
function r = p32(a)
    [~, r] = min(sum((a==0)'));
end

%Problem 33. Create times-tables
function m = p33(n)
    m = kron(1:n, (1:n)');
end

%Problem 34. Binary numbers
function A = p34(n)
    if n == 1
        A = [0; 1];
    else
        temp = p34(n - 1);
        A = [[temp; temp] [zeros(1, 2^(n - 1)) ones(1, 2^(n - 1))]'];
    end
end

%Problem 36. Find relatively common elements in matrix rows
function y = p36(x)
    values = unique(x);
    y = [];
    for v = values'
        [r, ~] = find(v == x);
        r = unique(r);
        if length(r) > floor(size(x, 1) / 2)
            y = [y v];
        end
    end
end

%Problem 37. Pascal's Triangle
function y = p37(n)
    y = zeros(1, n+1);
    for k = 0:n
        y(k+1) = nchoosek(n, k);
    end
end

%Problem 38. Return a list sorted by number of occurrences
function y = p38(x)
  x_u = unique(x);
  [~, n] = sort(histc(x,x_u),'descend');
  y = x_u(n);
end

%Problem 39. Which values occur exactly three times?
function y = p39(x)
    x_u = unique(x);
    y = sort(x_u((histc(x,x_u)) == 3));
end

%Problem 40. Reverse Run-Length Encoder
function y = p40(x)
    n = length(x);
    y = [];
    for i = 1:2:n-1
        y = [y x(i + 1) * ones(1, x(i))]
    end
end

%Problem 42. Find the alphabetic word product
function p = p42(s)
    s = lower(s);
    p = 1
    for i = 1:length(s)
        p = p * find('a':'z' == s(i))
    end
end

%Problem 43. Subset Sum
function ind = p43(v,n)
    dec2bin(1:2 ^ numel(v) - 1) == '1';
    ind = strfind(ans(ans * v' == n, :), 1);
end

%Problem 44. Trimming Spaces
function b = p44(a)
    find(a ~= ' ');
    b = a(min(ans):max(ans));
end

%Problem 45. Make a Palindrome Number
function tf = p45(a)
    b = str2num(flip(num2str(a)));
    while b ~= a
        a = a + b;
        b = str2num(flip(num2str(a)));
    end
end

%Problem 46. Which doors are open?
function y = p46(n)
    x = zeros(1, n);
    for i = 1:n 
        x(i:i:end) = (x(i:i:end) == 0);
    end
    y = find(x == 1);
end

%Problem 47. Extract leading non-zero digit
function y = p47(x)
    y = x;
    for i = 1:length(x)
        temp = num2str(x(i)) - '0';
        temp = temp(temp > 0);
        y(i) = temp(1);
    end
end

%Problem 48. Making change
function b = p48(a)
    cur = [10000 5000 2000 1000 500 200 100 50 25 10 5 1];
    b = zeros(1, length(cur));
    a=a*100;
    for i = 1:length(cur)
        b(i) = floor(a / cur(i));
        a = mod(a, cur(i));
    end
end

%Problem 49. Sums with Excluded Digits
function total = p49(n,m)
    total = 0;
    for v = 1:n
        if ~ ismember(m, num2str(v) - '0')
            total = total + v;
        end
    end
end

%Problem 50. QWERTY coordinates
function [r,c] = qwerty_coord(key)
    A = zeros(4, 10);  
    A(1,:) = '1234567890';  
    A(2,:) = 'qwertyuiop';  
    A(3,1:9) = 'asdfghjkl';  
    A(4,1:7) = 'zxcvbnm';  
    [r c] = find(A == key);
end
