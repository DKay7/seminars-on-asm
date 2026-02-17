
./eip-control-flow:     file format elf32-i386


Disassembly of section .init:

08049000 <_init>:
 8049000:	53                   	push   ebx
 8049001:	83 ec 08             	sub    esp,0x8
 8049004:	e8 07 01 00 00       	call   8049110 <__x86.get_pc_thunk.bx>
 8049009:	81 c3 eb 2f 00 00    	add    ebx,0x2feb
 804900f:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 8049015:	85 c0                	test   eax,eax
 8049017:	74 02                	je     804901b <_init+0x1b>
 8049019:	ff d0                	call   eax
 804901b:	83 c4 08             	add    esp,0x8
 804901e:	5b                   	pop    ebx
 804901f:	c3                   	ret

Disassembly of section .plt:

08049020 <setbuf@plt-0x10>:
 8049020:	ff 35 f8 bf 04 08    	push   DWORD PTR ds:0x804bff8
 8049026:	ff 25 fc bf 04 08    	jmp    DWORD PTR ds:0x804bffc
 804902c:	00 00                	add    BYTE PTR [eax],al
	...

08049030 <setbuf@plt>:
 8049030:	ff 25 00 c0 04 08    	jmp    DWORD PTR ds:0x804c000
 8049036:	68 00 00 00 00       	push   0x0
 804903b:	e9 e0 ff ff ff       	jmp    8049020 <_init+0x20>

08049040 <__libc_start_main@plt>:
 8049040:	ff 25 04 c0 04 08    	jmp    DWORD PTR ds:0x804c004
 8049046:	68 08 00 00 00       	push   0x8
 804904b:	e9 d0 ff ff ff       	jmp    8049020 <_init+0x20>

08049050 <printf@plt>:
 8049050:	ff 25 08 c0 04 08    	jmp    DWORD PTR ds:0x804c008
 8049056:	68 10 00 00 00       	push   0x10
 804905b:	e9 c0 ff ff ff       	jmp    8049020 <_init+0x20>

08049060 <getchar@plt>:
 8049060:	ff 25 0c c0 04 08    	jmp    DWORD PTR ds:0x804c00c
 8049066:	68 18 00 00 00       	push   0x18
 804906b:	e9 b0 ff ff ff       	jmp    8049020 <_init+0x20>

08049070 <fgets@plt>:
 8049070:	ff 25 10 c0 04 08    	jmp    DWORD PTR ds:0x804c010
 8049076:	68 20 00 00 00       	push   0x20
 804907b:	e9 a0 ff ff ff       	jmp    8049020 <_init+0x20>

08049080 <__stack_chk_fail@plt>:
 8049080:	ff 25 14 c0 04 08    	jmp    DWORD PTR ds:0x804c014
 8049086:	68 28 00 00 00       	push   0x28
 804908b:	e9 90 ff ff ff       	jmp    8049020 <_init+0x20>

08049090 <putchar@plt>:
 8049090:	ff 25 18 c0 04 08    	jmp    DWORD PTR ds:0x804c018
 8049096:	68 30 00 00 00       	push   0x30
 804909b:	e9 80 ff ff ff       	jmp    8049020 <_init+0x20>

080490a0 <__isoc99_scanf@plt>:
 80490a0:	ff 25 1c c0 04 08    	jmp    DWORD PTR ds:0x804c01c
 80490a6:	68 38 00 00 00       	push   0x38
 80490ab:	e9 70 ff ff ff       	jmp    8049020 <_init+0x20>

080490b0 <fputs@plt>:
 80490b0:	ff 25 20 c0 04 08    	jmp    DWORD PTR ds:0x804c020
 80490b6:	68 40 00 00 00       	push   0x40
 80490bb:	e9 60 ff ff ff       	jmp    8049020 <_init+0x20>

Disassembly of section .text:

080490c0 <_start>:
 80490c0:	31 ed                	xor    ebp,ebp
 80490c2:	5e                   	pop    esi
 80490c3:	89 e1                	mov    ecx,esp
 80490c5:	83 e4 f0             	and    esp,0xfffffff0
 80490c8:	50                   	push   eax
 80490c9:	54                   	push   esp
 80490ca:	52                   	push   edx
 80490cb:	e8 19 00 00 00       	call   80490e9 <_start+0x29>
 80490d0:	81 c3 24 2f 00 00    	add    ebx,0x2f24
 80490d6:	6a 00                	push   0x0
 80490d8:	6a 00                	push   0x0
 80490da:	51                   	push   ecx
 80490db:	56                   	push   esi
 80490dc:	8d 83 f9 d0 ff ff    	lea    eax,[ebx-0x2f07]
 80490e2:	50                   	push   eax
 80490e3:	e8 58 ff ff ff       	call   8049040 <__libc_start_main@plt>
 80490e8:	f4                   	hlt
 80490e9:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 80490ec:	c3                   	ret

080490ed <__wrap_main>:
 80490ed:	e9 10 01 00 00       	jmp    8049202 <main>
 80490f2:	66 90                	xchg   ax,ax
 80490f4:	66 90                	xchg   ax,ax
 80490f6:	66 90                	xchg   ax,ax
 80490f8:	66 90                	xchg   ax,ax
 80490fa:	66 90                	xchg   ax,ax
 80490fc:	66 90                	xchg   ax,ax
 80490fe:	66 90                	xchg   ax,ax

08049100 <_dl_relocate_static_pie>:
 8049100:	c3                   	ret
 8049101:	66 90                	xchg   ax,ax
 8049103:	66 90                	xchg   ax,ax
 8049105:	66 90                	xchg   ax,ax
 8049107:	66 90                	xchg   ax,ax
 8049109:	66 90                	xchg   ax,ax
 804910b:	66 90                	xchg   ax,ax
 804910d:	66 90                	xchg   ax,ax
 804910f:	90                   	nop

08049110 <__x86.get_pc_thunk.bx>:
 8049110:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 8049113:	c3                   	ret
 8049114:	66 90                	xchg   ax,ax
 8049116:	66 90                	xchg   ax,ax
 8049118:	66 90                	xchg   ax,ax
 804911a:	66 90                	xchg   ax,ax
 804911c:	66 90                	xchg   ax,ax
 804911e:	66 90                	xchg   ax,ax

08049120 <deregister_tm_clones>:
 8049120:	b8 44 c0 04 08       	mov    eax,0x804c044
 8049125:	3d 44 c0 04 08       	cmp    eax,0x804c044
 804912a:	74 24                	je     8049150 <deregister_tm_clones+0x30>
 804912c:	b8 00 00 00 00       	mov    eax,0x0
 8049131:	85 c0                	test   eax,eax
 8049133:	74 1b                	je     8049150 <deregister_tm_clones+0x30>
 8049135:	55                   	push   ebp
 8049136:	89 e5                	mov    ebp,esp
 8049138:	83 ec 14             	sub    esp,0x14
 804913b:	68 44 c0 04 08       	push   0x804c044
 8049140:	ff d0                	call   eax
 8049142:	83 c4 10             	add    esp,0x10
 8049145:	c9                   	leave
 8049146:	c3                   	ret
 8049147:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
 804914e:	00 
 804914f:	90                   	nop
 8049150:	c3                   	ret
 8049151:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
 8049158:	00 
 8049159:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

08049160 <register_tm_clones>:
 8049160:	b8 44 c0 04 08       	mov    eax,0x804c044
 8049165:	2d 44 c0 04 08       	sub    eax,0x804c044
 804916a:	89 c2                	mov    edx,eax
 804916c:	c1 e8 1f             	shr    eax,0x1f
 804916f:	c1 fa 02             	sar    edx,0x2
 8049172:	01 d0                	add    eax,edx
 8049174:	d1 f8                	sar    eax,1
 8049176:	74 20                	je     8049198 <register_tm_clones+0x38>
 8049178:	ba 00 00 00 00       	mov    edx,0x0
 804917d:	85 d2                	test   edx,edx
 804917f:	74 17                	je     8049198 <register_tm_clones+0x38>
 8049181:	55                   	push   ebp
 8049182:	89 e5                	mov    ebp,esp
 8049184:	83 ec 10             	sub    esp,0x10
 8049187:	50                   	push   eax
 8049188:	68 44 c0 04 08       	push   0x804c044
 804918d:	ff d2                	call   edx
 804918f:	83 c4 10             	add    esp,0x10
 8049192:	c9                   	leave
 8049193:	c3                   	ret
 8049194:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049198:	c3                   	ret
 8049199:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

080491a0 <__do_global_dtors_aux>:
 80491a0:	f3 0f 1e fb          	endbr32
 80491a4:	80 3d 68 c0 04 08 00 	cmp    BYTE PTR ds:0x804c068,0x0
 80491ab:	75 1b                	jne    80491c8 <__do_global_dtors_aux+0x28>
 80491ad:	55                   	push   ebp
 80491ae:	89 e5                	mov    ebp,esp
 80491b0:	83 ec 08             	sub    esp,0x8
 80491b3:	e8 68 ff ff ff       	call   8049120 <deregister_tm_clones>
 80491b8:	c6 05 68 c0 04 08 01 	mov    BYTE PTR ds:0x804c068,0x1
 80491bf:	c9                   	leave
 80491c0:	c3                   	ret
 80491c1:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 80491c8:	c3                   	ret
 80491c9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

080491d0 <frame_dummy>:
 80491d0:	f3 0f 1e fb          	endbr32
 80491d4:	eb 8a                	jmp    8049160 <register_tm_clones>
 80491d6:	66 90                	xchg   ax,ax
 80491d8:	66 90                	xchg   ax,ax
 80491da:	66 90                	xchg   ax,ax
 80491dc:	66 90                	xchg   ax,ax
 80491de:	66 90                	xchg   ax,ax

080491e0 <dispatch_sign>:
 80491e0:	83 f8 00             	cmp    eax,0x0
 80491e3:	7c 10                	jl     80491f5 <dispatch_sign.neg>
 80491e5:	74 07                	je     80491ee <dispatch_sign.zero>

080491e7 <dispatch_sign.pos>:
 80491e7:	b8 3a c0 04 08       	mov    eax,0x804c03a
 80491ec:	eb 0e                	jmp    80491fc <print_msg>

080491ee <dispatch_sign.zero>:
 80491ee:	b8 35 c0 04 08       	mov    eax,0x804c035
 80491f3:	eb 07                	jmp    80491fc <print_msg>

080491f5 <dispatch_sign.neg>:
 80491f5:	b8 2c c0 04 08       	mov    eax,0x804c02c
 80491fa:	eb 00                	jmp    80491fc <print_msg>

080491fc <print_msg>:
 80491fc:	e8 17 02 00 00       	call   8049418 <io_print_string>
 8049201:	c3                   	ret

08049202 <main>:
 8049202:	b8 ff ff ff ff       	mov    eax,0xffffffff
 8049207:	e8 d4 ff ff ff       	call   80491e0 <dispatch_sign>
 804920c:	31 c0                	xor    eax,eax
 804920e:	c3                   	ret

0804920f <get_stdin>:
 804920f:	55                   	push   ebp
 8049210:	89 e5                	mov    ebp,esp
 8049212:	a1 60 c0 04 08       	mov    eax,ds:0x804c060
 8049217:	5d                   	pop    ebp
 8049218:	c3                   	ret

08049219 <get_stdout>:
 8049219:	55                   	push   ebp
 804921a:	89 e5                	mov    ebp,esp
 804921c:	a1 64 c0 04 08       	mov    eax,ds:0x804c064
 8049221:	5d                   	pop    ebp
 8049222:	c3                   	ret

08049223 <io_get_dec>:
 8049223:	57                   	push   edi
 8049224:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049228:	83 e4 f0             	and    esp,0xfffffff0
 804922b:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 804922e:	55                   	push   ebp
 804922f:	89 e5                	mov    ebp,esp
 8049231:	57                   	push   edi
 8049232:	83 ec 14             	sub    esp,0x14
 8049235:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 804923b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804923e:	31 c0                	xor    eax,eax
 8049240:	83 ec 08             	sub    esp,0x8
 8049243:	8d 45 f0             	lea    eax,[ebp-0x10]
 8049246:	50                   	push   eax
 8049247:	68 08 a0 04 08       	push   0x804a008
 804924c:	e8 4f fe ff ff       	call   80490a0 <__isoc99_scanf@plt>
 8049251:	83 c4 10             	add    esp,0x10
 8049254:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 8049257:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 804925a:	65 2b 15 14 00 00 00 	sub    edx,DWORD PTR gs:0x14
 8049261:	74 05                	je     8049268 <io_get_dec+0x45>
 8049263:	e8 18 fe ff ff       	call   8049080 <__stack_chk_fail@plt>
 8049268:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 804926b:	c9                   	leave
 804926c:	8d 67 f8             	lea    esp,[edi-0x8]
 804926f:	5f                   	pop    edi
 8049270:	c3                   	ret

08049271 <io_get_udec>:
 8049271:	57                   	push   edi
 8049272:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049276:	83 e4 f0             	and    esp,0xfffffff0
 8049279:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 804927c:	55                   	push   ebp
 804927d:	89 e5                	mov    ebp,esp
 804927f:	57                   	push   edi
 8049280:	83 ec 14             	sub    esp,0x14
 8049283:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 8049289:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804928c:	31 c0                	xor    eax,eax
 804928e:	83 ec 08             	sub    esp,0x8
 8049291:	8d 45 f0             	lea    eax,[ebp-0x10]
 8049294:	50                   	push   eax
 8049295:	68 0b a0 04 08       	push   0x804a00b
 804929a:	e8 01 fe ff ff       	call   80490a0 <__isoc99_scanf@plt>
 804929f:	83 c4 10             	add    esp,0x10
 80492a2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 80492a5:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 80492a8:	65 2b 15 14 00 00 00 	sub    edx,DWORD PTR gs:0x14
 80492af:	74 05                	je     80492b6 <io_get_udec+0x45>
 80492b1:	e8 ca fd ff ff       	call   8049080 <__stack_chk_fail@plt>
 80492b6:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 80492b9:	c9                   	leave
 80492ba:	8d 67 f8             	lea    esp,[edi-0x8]
 80492bd:	5f                   	pop    edi
 80492be:	c3                   	ret

080492bf <io_get_hex>:
 80492bf:	57                   	push   edi
 80492c0:	8d 7c 24 08          	lea    edi,[esp+0x8]
 80492c4:	83 e4 f0             	and    esp,0xfffffff0
 80492c7:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 80492ca:	55                   	push   ebp
 80492cb:	89 e5                	mov    ebp,esp
 80492cd:	57                   	push   edi
 80492ce:	83 ec 14             	sub    esp,0x14
 80492d1:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 80492d7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80492da:	31 c0                	xor    eax,eax
 80492dc:	83 ec 08             	sub    esp,0x8
 80492df:	8d 45 f0             	lea    eax,[ebp-0x10]
 80492e2:	50                   	push   eax
 80492e3:	68 0e a0 04 08       	push   0x804a00e
 80492e8:	e8 b3 fd ff ff       	call   80490a0 <__isoc99_scanf@plt>
 80492ed:	83 c4 10             	add    esp,0x10
 80492f0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 80492f3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 80492f6:	65 2b 15 14 00 00 00 	sub    edx,DWORD PTR gs:0x14
 80492fd:	74 05                	je     8049304 <io_get_hex+0x45>
 80492ff:	e8 7c fd ff ff       	call   8049080 <__stack_chk_fail@plt>
 8049304:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049307:	c9                   	leave
 8049308:	8d 67 f8             	lea    esp,[edi-0x8]
 804930b:	5f                   	pop    edi
 804930c:	c3                   	ret

0804930d <io_get_char>:
 804930d:	55                   	push   ebp
 804930e:	89 e5                	mov    ebp,esp
 8049310:	83 e4 f0             	and    esp,0xfffffff0
 8049313:	e8 48 fd ff ff       	call   8049060 <getchar@plt>
 8049318:	c9                   	leave
 8049319:	c3                   	ret

0804931a <io_get_string>:
 804931a:	57                   	push   edi
 804931b:	8d 7c 24 08          	lea    edi,[esp+0x8]
 804931f:	83 e4 f0             	and    esp,0xfffffff0
 8049322:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049325:	55                   	push   ebp
 8049326:	89 e5                	mov    ebp,esp
 8049328:	57                   	push   edi
 8049329:	83 ec 14             	sub    esp,0x14
 804932c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804932f:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 8049332:	a1 60 c0 04 08       	mov    eax,ds:0x804c060
 8049337:	83 ec 04             	sub    esp,0x4
 804933a:	50                   	push   eax
 804933b:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 804933e:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 8049341:	e8 2a fd ff ff       	call   8049070 <fgets@plt>
 8049346:	83 c4 10             	add    esp,0x10
 8049349:	90                   	nop
 804934a:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 804934d:	c9                   	leave
 804934e:	8d 67 f8             	lea    esp,[edi-0x8]
 8049351:	5f                   	pop    edi
 8049352:	c3                   	ret

08049353 <io_print_dec>:
 8049353:	57                   	push   edi
 8049354:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049358:	83 e4 f0             	and    esp,0xfffffff0
 804935b:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 804935e:	55                   	push   ebp
 804935f:	89 e5                	mov    ebp,esp
 8049361:	57                   	push   edi
 8049362:	83 ec 14             	sub    esp,0x14
 8049365:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8049368:	83 ec 08             	sub    esp,0x8
 804936b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 804936e:	68 08 a0 04 08       	push   0x804a008
 8049373:	e8 d8 fc ff ff       	call   8049050 <printf@plt>
 8049378:	83 c4 10             	add    esp,0x10
 804937b:	90                   	nop
 804937c:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 804937f:	c9                   	leave
 8049380:	8d 67 f8             	lea    esp,[edi-0x8]
 8049383:	5f                   	pop    edi
 8049384:	c3                   	ret

08049385 <io_print_udec>:
 8049385:	57                   	push   edi
 8049386:	8d 7c 24 08          	lea    edi,[esp+0x8]
 804938a:	83 e4 f0             	and    esp,0xfffffff0
 804938d:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049390:	55                   	push   ebp
 8049391:	89 e5                	mov    ebp,esp
 8049393:	57                   	push   edi
 8049394:	83 ec 14             	sub    esp,0x14
 8049397:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804939a:	83 ec 08             	sub    esp,0x8
 804939d:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 80493a0:	68 0b a0 04 08       	push   0x804a00b
 80493a5:	e8 a6 fc ff ff       	call   8049050 <printf@plt>
 80493aa:	83 c4 10             	add    esp,0x10
 80493ad:	90                   	nop
 80493ae:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 80493b1:	c9                   	leave
 80493b2:	8d 67 f8             	lea    esp,[edi-0x8]
 80493b5:	5f                   	pop    edi
 80493b6:	c3                   	ret

080493b7 <io_print_hex>:
 80493b7:	57                   	push   edi
 80493b8:	8d 7c 24 08          	lea    edi,[esp+0x8]
 80493bc:	83 e4 f0             	and    esp,0xfffffff0
 80493bf:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 80493c2:	55                   	push   ebp
 80493c3:	89 e5                	mov    ebp,esp
 80493c5:	57                   	push   edi
 80493c6:	83 ec 14             	sub    esp,0x14
 80493c9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80493cc:	83 ec 08             	sub    esp,0x8
 80493cf:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 80493d2:	68 0e a0 04 08       	push   0x804a00e
 80493d7:	e8 74 fc ff ff       	call   8049050 <printf@plt>
 80493dc:	83 c4 10             	add    esp,0x10
 80493df:	90                   	nop
 80493e0:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 80493e3:	c9                   	leave
 80493e4:	8d 67 f8             	lea    esp,[edi-0x8]
 80493e7:	5f                   	pop    edi
 80493e8:	c3                   	ret

080493e9 <io_print_char>:
 80493e9:	57                   	push   edi
 80493ea:	8d 7c 24 08          	lea    edi,[esp+0x8]
 80493ee:	83 e4 f0             	and    esp,0xfffffff0
 80493f1:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 80493f4:	55                   	push   ebp
 80493f5:	89 e5                	mov    ebp,esp
 80493f7:	57                   	push   edi
 80493f8:	83 ec 14             	sub    esp,0x14
 80493fb:	88 45 f4             	mov    BYTE PTR [ebp-0xc],al
 80493fe:	0f be 45 f4          	movsx  eax,BYTE PTR [ebp-0xc]
 8049402:	83 ec 0c             	sub    esp,0xc
 8049405:	50                   	push   eax
 8049406:	e8 85 fc ff ff       	call   8049090 <putchar@plt>
 804940b:	83 c4 10             	add    esp,0x10
 804940e:	90                   	nop
 804940f:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049412:	c9                   	leave
 8049413:	8d 67 f8             	lea    esp,[edi-0x8]
 8049416:	5f                   	pop    edi
 8049417:	c3                   	ret

08049418 <io_print_string>:
 8049418:	57                   	push   edi
 8049419:	8d 7c 24 08          	lea    edi,[esp+0x8]
 804941d:	83 e4 f0             	and    esp,0xfffffff0
 8049420:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049423:	55                   	push   ebp
 8049424:	89 e5                	mov    ebp,esp
 8049426:	57                   	push   edi
 8049427:	83 ec 14             	sub    esp,0x14
 804942a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804942d:	a1 64 c0 04 08       	mov    eax,ds:0x804c064
 8049432:	83 ec 08             	sub    esp,0x8
 8049435:	50                   	push   eax
 8049436:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 8049439:	e8 72 fc ff ff       	call   80490b0 <fputs@plt>
 804943e:	83 c4 10             	add    esp,0x10
 8049441:	90                   	nop
 8049442:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049445:	c9                   	leave
 8049446:	8d 67 f8             	lea    esp,[edi-0x8]
 8049449:	5f                   	pop    edi
 804944a:	c3                   	ret

0804944b <io_newline>:
 804944b:	57                   	push   edi
 804944c:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049450:	83 e4 f0             	and    esp,0xfffffff0
 8049453:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049456:	55                   	push   ebp
 8049457:	89 e5                	mov    ebp,esp
 8049459:	57                   	push   edi
 804945a:	83 ec 04             	sub    esp,0x4
 804945d:	83 ec 0c             	sub    esp,0xc
 8049460:	6a 0a                	push   0xa
 8049462:	e8 29 fc ff ff       	call   8049090 <putchar@plt>
 8049467:	83 c4 10             	add    esp,0x10
 804946a:	90                   	nop
 804946b:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 804946e:	c9                   	leave
 804946f:	8d 67 f8             	lea    esp,[edi-0x8]
 8049472:	5f                   	pop    edi
 8049473:	c3                   	ret

08049474 <unbuffer_stdout>:
 8049474:	55                   	push   ebp
 8049475:	89 e5                	mov    ebp,esp
 8049477:	83 ec 08             	sub    esp,0x8
 804947a:	a1 64 c0 04 08       	mov    eax,ds:0x804c064
 804947f:	83 ec 08             	sub    esp,0x8
 8049482:	6a 00                	push   0x0
 8049484:	50                   	push   eax
 8049485:	e8 a6 fb ff ff       	call   8049030 <setbuf@plt>
 804948a:	83 c4 10             	add    esp,0x10
 804948d:	90                   	nop
 804948e:	c9                   	leave
 804948f:	c3                   	ret

Disassembly of section .fini:

08049490 <_fini>:
 8049490:	53                   	push   ebx
 8049491:	83 ec 08             	sub    esp,0x8
 8049494:	e8 77 fc ff ff       	call   8049110 <__x86.get_pc_thunk.bx>
 8049499:	81 c3 5b 2b 00 00    	add    ebx,0x2b5b
 804949f:	83 c4 08             	add    esp,0x8
 80494a2:	5b                   	pop    ebx
 80494a3:	c3                   	ret
