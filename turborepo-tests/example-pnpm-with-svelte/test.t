  $ . ${TESTDIR}/../helpers/setup_example_test.sh with-svelte pnpm@8.9.0

# run twice and make sure it works
  $ pnpm run build lint --output-logs=errors-only
  
  \> @ build (.*)/test.t (re)
  \> turbo run build "lint" "--output-logs=errors-only" (re)
  
  \xe2\x80\xa2 Packages in scope: @repo/eslint-config, @repo/ui, docs, web (esc)
  \xe2\x80\xa2 Running build, lint in 4 packages (esc)
  \xe2\x80\xa2 Remote caching disabled (esc)
  
   Tasks:    5 successful, 5 total
  Cached:    0 cached, 5 total
    Time:\s*[\.0-9ms]+  (re)
  
  $ pnpm run build lint --output-logs=errors-only
  
  \> @ build (.*)/test.t (re)
  \> turbo run build "lint" "--output-logs=errors-only" (re)
  
  \xe2\x80\xa2 Packages in scope: @repo/eslint-config, @repo/ui, docs, web (esc)
  \xe2\x80\xa2 Running build, lint in 4 packages (esc)
  \xe2\x80\xa2 Remote caching disabled (esc)
  
   Tasks:    5 successful, 5 total
  Cached:    5 cached, 5 total
    Time:\s*[\.0-9ms]+ >>> FULL TURBO (re)
  
  $ git diff
