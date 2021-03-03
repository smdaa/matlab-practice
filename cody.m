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

