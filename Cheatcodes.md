# warp

### Signature

```
function warp(uint256) external;
```

### Description

Sets block.timestamp.

### Examples

```
vm.warp(1641070800);
emit log_uint(block.timestamp); // 1641070800
```
