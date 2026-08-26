bool isPalindrome(int x) 
{
     if (x < 0)
        return false;

    int len = snprintf(NULL, 0, "%d", x);
    char *str = malloc(len + 1);

    if (!str)
        return false;

    snprintf(str, len + 1, "%d", x);

    for (int i = 0; i < len / 2; i++)
    {
        if (str[i] != str[len - 1 - i])
        {
            free(str);
            return false;
        }
    }

    free(str);
    return true;
}